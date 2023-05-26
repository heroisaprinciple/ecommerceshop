class CartsController < ApplicationController
  def show
    @cart_products = resource
  end

  def create_checkout_session
    if user_signed_in? && current_user
      Stripe.api_key = ENV['STRIPE_API_KEY']
      current_user.set_payment_processor :stripe
      current_user.payment_processor.customer

      @cart_products = resource

      # total_amount = (@cart_products.sum(&:price).to_f * 100).to_i
      checkout_session = current_user.payment_processor.checkout(
        line_items: [{
                       quantity: 1,
                       price_data: {
                         currency: 'eur',
                         unit_amount: total_amount,
                         product_data: {
                           name: 'Cart Total'
                         }
                       }
                     }],
        mode: 'payment',
        success_url: success_url + "?session_id={CHECKOUT_SESSION_ID}",
        cancel_url: 'https://localhost:3000/cancel'
      )

      redirect_to checkout_session.url, allow_other_host: true, status: 303
    end
  end

  def success
    @cart_products = resource
    total_amount = (@cart_products.sum(&:price).to_f * 100).to_i
    payment_session = Stripe::Checkout::Session.retrieve(current_user.payment_processor.checkout.id, expand: ["line_items"])

    if payment_session.payment_status == 'paid'
      @payment = Payment.create(sum: total_amount, status: Payment.statuses[:paid], paid_at: Time.current,
                                payment_method: 'cart',
                                user_id: current_user.id, cart_id: current_user.cart.id)
    end
  end

  def add_product
    if user_signed_in?
      current_user.cart ||= Cart.create(user_id: current_user.id)
      cart_service = Carts::UsersCartsService.new(current_user.cart)
    else
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

  def resource
    if user_signed_in? && current_user.cart.present?
      current_user.cart.cart_products.includes(:product)
    elsif Carts::LocalCartsService.instance.local_cart.present?
      cart_service = Carts::LocalCartsService.instance
      cart_service.local_cart.map { |product| CartProduct.new(product_id: product[:id], quantity: product[:quantity]) }
    end
  end
end