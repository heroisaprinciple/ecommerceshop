require 'rails_helper'

RSpec.describe OrdersController, type: :request do
  include_context :authorize_user
  let!(:order) { create(:order, user: current_user) }

  describe "GET #index" do
    it "is successful" do
      get orders_path

      expect(response).to be_successful
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get order_path(id: order.id)
      expect(response).to be_successful

      expect(response).to render_template(:show)
      expect(response.body).to include(order.id.to_s)
    end
  end

  describe 'GET #edit' do
    it 'returns a successful response' do
      get edit_order_path(id: order.id)

      expect(response).to be_successful
      expect(response).to render_template(:edit)

      expect(assigns(:order)).to eq(order)
      expect(assigns(:order).order_detail).to be_present
      expect(assigns(:order).order_detail.address).to be_present
    end
  end
end
