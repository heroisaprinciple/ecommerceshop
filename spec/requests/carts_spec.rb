require 'rails_helper'

RSpec.describe CartsController, type: :request do
  let(:product) { create(:product) }
  let(:cart) { create(:cart) }

  describe 'GET #show' do
    it 'returns a successful response' do
      get show_cart_path(id: cart.id)

      expect(response).to be_successful
      expect(response).to render_template(:show)
    end
  end

  describe "for authenticated user" do
    include_context :authorize_user

    describe 'POST #add_product' do
      it 'adds a product to the cart' do
        expect do
          post add_product_to_cart_path(product.id)
        end.to change(CartProduct, :count).by(1)
      end
    end

    describe 'DELETE #destroy_product' do
      it 'removes a product from the cart' do
        post add_product_to_cart_path(product.id)

        expect do
          delete destroy_cart_product_path(product.id)
        end.to change(CartProduct, :count).by(-1)

        expect(response).to redirect_to(show_cart_path)
      end
    end
  end

  describe "for non authenticated user" do
    describe 'POST #add_product' do
      it 'adds a product to the cart' do
        post add_product_to_cart_path(product.id)

        expect(session[:product_ids]).to eq([product.id])
      end
    end

    describe 'DELETE #destroy_product' do
      it 'removes a product from the cart' do
        post add_product_to_cart_path(product.id)
        delete destroy_cart_product_path(product.id)

        expect(session[:product_ids]).to eq([])
        expect(response).to redirect_to(show_cart_path)
      end
    end
  end
end

