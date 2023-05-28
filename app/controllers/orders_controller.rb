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
    if @order.update(order_params)
      @order.status = Order.statuses[:complete]
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
                                                            address_attributes: [:country, :city, :street, :comment]])
  end
end
