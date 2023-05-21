class ProductsController < ApplicationController
  def index
    @products = collection
  end

  def show
    @product = resource
  end

  private

  def collection
    Product.paginate_order.page(params[:page])
  end

  def resource
    collection.friendly.find(params[:slug])
  end
end
