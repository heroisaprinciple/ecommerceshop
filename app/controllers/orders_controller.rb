class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @orders = collection
  end

  def show
    @order = resource
    @sum = sum
    @order.build_order_detail
    @order.order_detail.build_address
  end

  def create
    if user_signed_in?
      @order = current_user.orders.create(ordered_at: DateTime.current, user_id: current_user.id)
      @order.products << current_user.cart.products
      @order.save
      current_user.cart.products.clear
    elsif session[:product_ids]
      @order = Order.new(ordered_at: DateTime.current)
      @order.products << Product.find(session[:product_ids])
      @order.save
    end
    redirect_to order_path(@order.id)
  end

  def success
    @order = resource
    render :order_confirmed
  end

  def update
    @order = resource
    if @order.update(order_params)
      @order.status = 'completed'
      redirect_to orders_success_path(@order.id)
    else
      render :show, status: 422
    end
  end

  def sum
    @order.products.pluck(:price).map(&:to_f).sum
  end

  private

  def collection
    current_user.orders
  end

  def resource
    collection.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status,
                                  order_detail_attributes: [:first_name, :last_name, :email,
                                                            address_attributes: [:country, :city, :street, :comment]])
  end
end
