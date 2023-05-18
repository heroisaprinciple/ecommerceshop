class CartsController < ApplicationController
  def show
    @cart_products = resource
  end

  def create_checkout_session
    Stripe.api_key = ENV['STRIPE_API_KEY']
    current_user.set_payment_processor :stripe
    current_user.payment_processor.customer

    @cart_products = resource

    total_amount = (@cart_products.sum(&:price).to_f * 100).to_i
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
      success_url: 'https://localhost:3000/success?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: 'https://localhost:3000/cancel'
    )

    redirect_to checkout_session.url, allow_other_host: true, status: 303
  end

  def add_product
    if user_signed_in?
      current_user.cart ||= Cart.create(user_id: current_user.id)
      current_user.cart.products << Product.find(params[:id])
    else
      user_cart = Cart.new
      if session[:product_ids].present?
        session[:product_ids] << params[:id].to_i
      else
        session[:product_ids] = [params[:id].to_i]
      end
    end
  end
  def destroy_product
    if user_signed_in?
      current_user.cart.products.destroy(params[:id])
    else
      session[:product_ids].delete(params[:id].to_i)
    end
    redirect_to show_cart_path
  end

  private

  def resource
    if user_signed_in?
      current_user.cart.products
    elsif session[:product_ids].present?
      Product.where(id: session[:product_ids])
    end
  end
end