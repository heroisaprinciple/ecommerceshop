class OrdersController < ApplicationController
  def index
    @orders = collection
  end

  def show
    @order = resource
    @sum = sum
  end

  def create
    if user_signed_in?
      @order = current_user.orders.new(user_id: current_user.id, ordered_at: Time.now)
      # binding.break
      @order.save!
      # binding.break
      @cart_products = current_user.cart.products
      @cart_products.each do |cart_product|
        @ordered_product = ProductOrder.new(order_id: @order.id, product_id: cart_product.id)
        @ordered_product.save!
      end

      # TODO: address is not being created (forms)
      @address = current_user.addresses.new(address_params)
      # binding.break
      @address.user_id = current_user.id
      @address.save!
      # binding.break

      @order_details = OrderDetail.create(firstname: current_user.firstname,
                                          lastname: current_user.lastname,
                                          email: current_user.email,
                                          order_id: @order.id,
                                          address_id: @address.id)
      # binding.break

    elsif session[:product_ids]
      @order = Order.new
      @order.save!
      @cart_products = Product.where(id: session[:product_ids])
      @cart_products.each do |cart_product|
        @ordered_product = ProductOrder.create(order_id: @order.id, product_id: cart_product.id)
        @ordered_product.save!
      end

      @address = Address.new(address_params)
      @address.save!
      @order_details = OrderDetail.new(order_details_params)
      @order_details.order_id = @order.id
      @order_details.address_id = @address.id
      @order_details.save!
    end
  end

  def update
    @order = current_user.orders.last
    if @order.update!(status: 'Completed')
      render 'order_confirmed'
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
      Product.find(session[:product_ids])
    end
  end

  def resource
    if user_signed_in?
      collection.find(params[:id])
    end
  end

  def address_params
    params.require(:address).permit(:country, :city, :street, :comment, :comment)
  end

  def order_details_params
    params.require(:order_details).permit(:firstname, :lastname, :email)
  end
end