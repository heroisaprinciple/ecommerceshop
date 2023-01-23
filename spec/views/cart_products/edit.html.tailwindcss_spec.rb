require 'rails_helper'

RSpec.describe "cart_products/edit", type: :view do
  let(:cart_product) {
    CartProduct.create!()
  }

  before(:each) do
    assign(:cart_product, cart_product)
  end

  it "renders the edit cart_product form" do
    render

    assert_select "form[action=?][method=?]", cart_product_path(cart_product), "post" do
    end
  end
end
