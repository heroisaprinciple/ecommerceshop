class OrdersController < ApplicationController
  def index
    if user_signed_in?
      @orders = collection
    end
  end

  def show
    @order = resource
    @sum = sum
    # binding.break
    @order.build_order_detail
    @order.order_detail.build_address
  end

  def create
    if user_signed_in?
      @order = current_user.orders.create(ordered_at: DateTime.current, user_id: current_user.id)
      @order.products << current_user.cart.products
      @order.save
      # current_user.cart.clear
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
      if @order.save
        redirect_to orders_success_path(@order.id)
      end
    else
      render :show, status: 422
    end
  end

  def sum
    # Devise generates prices in '0.4701e2' form, this is why go_f is necessary here
    @order.products.pluck(:price).map {|el| el.to_f}.sum
  end

  private
  def collection
    if user_signed_in?
      current_user.orders
    elsif session[:product_ids].present?
      Order.all
    end
  end

  def resource
    collection.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status,
                                  order_detail_attributes: [:firstname, :lastname, :email,
                                                            address_attributes: [:country, :city, :street, :comment]])
  end
end