require 'rails_helper'

RSpec.describe "order_details/edit", type: :view do
  let(:order_detail) {
    OrderDetail.create!()
  }

  before(:each) do
    assign(:order_detail, order_detail)
  end

  it "renders the edit order_detail form" do
    render

    assert_select "form[action=?][method=?]", order_detail_path(order_detail), "post" do
    end
  end
end
