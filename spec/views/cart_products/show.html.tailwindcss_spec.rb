require 'rails_helper'

RSpec.describe "cart_products/show", type: :view do
  before(:each) do
    assign(:cart_product, CartProduct.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
