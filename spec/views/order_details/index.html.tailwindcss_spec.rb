require 'rails_helper'

RSpec.describe "order_details/index", type: :view do
  before(:each) do
    assign(:order_details, [
      OrderDetail.create!(),
      OrderDetail.create!()
    ])
  end

  it "renders a list of order_details" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
