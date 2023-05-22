class ProductsController < ApplicationController
  def index
    @products = collection
  end

  def show
    @product = resource
  end

  private

  def collection
    Product.find_by_category_slug(params[:category_slug])
  end

  def resource
    Product.friendly.find(params[:slug])
  end
end
