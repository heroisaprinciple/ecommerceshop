class CategoriesController < ApplicationController
  def index
    @categories = collection
  end

  def show
    @category = resource
  end

  private

  def collection
    # TODO: show on refactoring lesson: it is always better to use SQL context in the scope (in the model)
    # Category.order(priority: :desc)
    Category.ordered
  end

  def resource
    collection.friendly.find(params[:slug])
  end
end
