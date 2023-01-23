require 'rails_helper'

RSpec.describe "cart_products/index", type: :view do
  before(:each) do
    assign(:cart_products, [
      CartProduct.create!(),
      CartProduct.create!()
    ])
  end

  it "renders a list of cart_products" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
