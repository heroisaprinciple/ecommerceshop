class ProductsController < ApplicationController
  # before_action :create_checkout_session
  def index
    @products = collection
  end

  def show
    @product = resource
  end

  def create_checkout_session
    product = Product.find(params[:id])
    session = Stripe::Checkout::Session.create({
                                                 line_items: [{
                                                                # Provide the exact Price ID (e.g. pr_1234) of the product you want to sell
                                                                price: 'price_1MzNz4Cgf1GDd0wQRUACxOiF',
                                                                quantity: 1,
                                                              }],
                                                 mode: 'payment',
                                                 success_url: 'https://localhost:3000/success?session_id={CHECKOUT_SESSION_ID}',
                                                 cancel_url: 'https://localhost:3000/cancel',
                                               })
    redirect_to session.url, allow_other_host: true, status: 303
  end

  private

  def collection
    Product.paginate_order.page(params[:page])
  end

  def resource
    collection.find(params[:id])
  end
end
