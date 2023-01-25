class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :initialize_session
  before_action :load_cart
  before_action :make_order

  def initialize_session
    session[:cart] ||= [] # empty cart => empty array
  end

  def load_cart
    # products that belong to this cart
    @cart = Product.find(session[:cart])
  end

  def make_order
    @orders = Order.all
  end

end
