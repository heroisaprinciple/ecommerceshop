class OrderBuilder
  attr_accessor :order

  def self.build
    builder = new
    yield(builder)
    builder.order
  end

  def initialize
    @order = Order.new
  end

  def set_status
    @order.status = Order.statuses[:pending]
  end

  def set_ordered_time
    @order.ordered_at = DateTime.current
  end

  def set_user(user)
    @order.user = user
  end

  def set_payment(payment)
    @order.payment = payment
  end

  def set_products(products)
    @order.products << products
  end
end
class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = collection
  end

  def show
    @order = resource
  end

  def edit
    @order = resource

    @order.build_order_detail
    @order.order_detail.build_address
  end

  def success
    @order = resource
    render :order_confirmed
  end

  def update
    @order = resource
    updated_order_params = order_params
    updated_order_params[:order_detail_attributes] = updated_order_params[:order_detail_attributes].merge(get_order_details)

    if @order.update(updated_order_params)
      @order.update(status: Order.statuses[:complete])
      redirect_to orders_success_path(@order.id)
    else
      render :show, status: 422
    end
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
                                                            address_attributes: [:country, :city, :street, :comment, :user_id]])
  end

  def get_order_details
    {
      firstname: current_user.first_name,
      lastname: current_user.last_name,
      email: current_user.email
    }
  end
end
