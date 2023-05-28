class CategoriesController < ApplicationController
  def index
    @categories = collection
  end

  def show
    @category = resource
  end

  private

  def collection
    Category.ordered
  end

  def resource
    collection.friendly.find(params[:slug])
  end
end
