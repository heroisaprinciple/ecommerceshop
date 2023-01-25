require 'rails_helper'

RSpec.describe "product_orders/new", type: :view do
  before(:each) do
    assign(:product_order, ProductOrder.new())
  end

  it "renders new product_order form" do
    render

    assert_select "form[action=?][method=?]", product_orders_path, "post" do
    end
  end
end
