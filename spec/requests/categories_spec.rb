require 'rails_helper'

RSpec.describe CategoriesController, type: :request do
  let!(:category) { create(:category) }
  let!(:categories) { FactoryBot.create_list(:category, 5) }

  describe 'GET #index' do
    it 'returns a successful response' do
      get categories_path

      expect(response).to be_successful
    end

    it 'assigns @categories with ordered collection' do
      get categories_path
      expect(assigns(:categories)).to eq(Category.ordered)
    end
  end

  describe 'GET #show' do
    it "returns a successful response" do
      get category_path(category)

      expect(response).to be_successful
      expect(response).to render_template(:show)
      expect(response.body).to include(category.name)
      expect(response.body).to include(category.priority.to_s)
    end
  end
end
