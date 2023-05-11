class CheckoutController < ApplicationController
  def create
    product = Product.find(params[:id])
    binding.pry
    session = Stripe::Checkout::Session.create({
                                                   line_items: [{
                                                                  # Provide the exact Price ID (e.g. pr_1234) of the product you want to sell
                                                                  price: 'price_1MzNz4Cgf1GDd0wQRUACxOiF',
                                                                  quantity: 1,
                                                                }],
                                                   mode: 'payment',
                                                   success_url: root_path,
                                                   cancel_url: root_path,
                                                 })
    redirect session.url, 303
  end
end
