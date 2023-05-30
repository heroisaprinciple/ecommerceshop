class PaymentProcessingFactory
  def self.create_payment(type)
    case type
    when :stripe
      StripePaymentProcessor.new
    else
      # AnotherPaymentProcessor.new
    end
  end
end

class StripePaymentProcessor < PaymentProcessingFactory
  Stripe.api_key = ENV['STRIPE_API_KEY']
  def checkout(current_user, success_url, cancel_url)
    current_user.set_payment_processor :stripe
    current_user.payment_processor.customer

    resource = current_user.cart.cart_products.includes(:product)
    @cart_products = resource

    line_items = @cart_products.map do |item|
      {
        price_data: {
          currency: "eur",
          product_data: {
            name: item.product.name,
            description: item.product.description,
            metadata: {
              id: item.product.id
            },
          },
          unit_amount_decimal: item.product.price * 100,
        },
        quantity: item.quantity,
      }
    end

    current_user.payment_processor.checkout(
      line_items: line_items,
      mode: 'payment',
      success_url: success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: cancel_url
    )
  end

  def session(session_id)
    Stripe::Checkout::Session.retrieve(session_id)
  end
end

class CartsController < ApplicationController
  def show
    @cart_products = resource
  end

  def create_checkout_session
    if user_signed_in? && current_user
      payment = PaymentProcessingFactory.create_payment(:stripe)
      checkout_session = payment.checkout(current_user, success_url, cancel_url)

      # Session could be in the factory, but sessions are available only in controllers
      session[:checkout_session_id] = checkout_session.id

      redirect_to checkout_session.url, allow_other_host: true, status: 303
    end
  end

  def success
    Stripe.api_key = ENV['STRIPE_API_KEY']
    @cart_products = resource
    total_amount = total(@cart_products)
    payment = PaymentProcessingFactory.create_payment(:stripe)
    payment_session = payment.session(session[:checkout_session_id])

    if payment_session.payment_status == 'paid'
      payment = create_payment(total_amount)
      create_order(payment)
      clear_cart

      redirect_to edit_order_path(id: @order.id)
    end
  end

  def create_payment(total_amount)
    @payment = Payment.create(
      sum: total_amount,
      status: Payment.statuses[:paid],
      paid_at: DateTime.current,
      payment_method: 'cart',
      user_id: current_user.id,
      cart_id: current_user.cart.id
    )
  end

  def create_order(payment)
    @order = OrderBuilder.build do |builder|
      builder.set_status
      builder.set_ordered_time
      builder.set_user(current_user)
      builder.set_payment(payment)
      builder.set_products(current_user.cart.products)
    end

    @order.save
  end

  def clear_cart
    current_user.cart.products.destroy_all
  end

  def cancel
    redirect_to root_path
  end

  def add_product
    if user_signed_in?
      current_user.cart ||= Cart.create(user_id: current_user.id)
      cart_service = Carts::UsersCartsService.new(current_user.cart)
    else
      # like a session storage for products
      # singleton is used to store products
      cart_service = Carts::LocalCartsService.instance
    end

    cart_service.add_to_cart(Product.find(params[:id]).id, params.dig(:cart_product, :quantity))
  end

  def destroy_product
    if user_signed_in?
      cart_service = Carts::UsersCartsService.new(current_user.cart)
    else
      cart_service = Carts::LocalCartsService.instance
    end
    # If send slugs (instead of ids), then LocalCartsService won't work
    cart_service.delete_from_cart(Product.find(params[:id]).id, params.dig(:cart_product, :quantity))

    redirect_to show_cart_path
  end

  private

  def total(cart_products)
    (cart_products.sum { |cart_prod| cart_prod.product.price.to_f * cart_prod.quantity * 100 }).to_i
  end

  def resource
    if user_signed_in? && current_user.cart.present?
      current_user.cart.cart_products.includes(:product)
    elsif Carts::LocalCartsService.instance.local_cart.present?
      cart_service = Carts::LocalCartsService.instance
      cart_service.local_cart.map { |product| CartProduct.new(product_id: product[:id], quantity: product[:quantity]) }
    end
  end
end