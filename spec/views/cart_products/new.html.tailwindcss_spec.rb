require 'rails_helper'

RSpec.describe "cart_products/new", type: :view do
  before(:each) do
    assign(:cart_product, CartProduct.new())
  end

  it "renders new cart_product form" do
    render

    assert_select "form[action=?][method=?]", cart_products_path, "post" do
    end
  end
end
