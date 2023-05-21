require 'rails_helper'

RSpec.describe ProductsController, type: :request do
  let(:sleek_concrete_watch) { create(:product, :sleek_concrete_watch) }
  let(:mediocre_wooden_chair) { create(:product, :mediocre_wooden_chair) }
  let!(:products) { FactoryBot.create_list :product, 6 }
  let(:category) { create(:category) }

  describe 'GET #index' do
    it 'returns a successful response' do
      get category_products_path(category_slug: category.slug)

      expect(response).to be_successful
    end

    it 'assigns @products with paginated collection' do
       get category_products_path(category_slug: category.slug)

       expect(assigns(:products)).to eq(products)
    end
  end

  describe 'GET #show' do
    it "is successful" do
      get category_product_path(slug: sleek_concrete_watch.slug, category_slug: category.slug)

      expect(response).to be_successful
      expect(response).to render_template(:show)
      expect(response.body).to include(sleek_concrete_watch.name)
      expect(response.body).to include(sleek_concrete_watch.price.to_s)
    end
  end
end
