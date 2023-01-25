require 'rails_helper'

RSpec.describe "product_orders/edit", type: :view do
  let(:product_order) {
    ProductOrder.create!()
  }

  before(:each) do
    assign(:product_order, product_order)
  end

  it "renders the edit product_order form" do
    render

    assert_select "form[action=?][method=?]", product_order_path(product_order), "post" do
    end
  end
end
