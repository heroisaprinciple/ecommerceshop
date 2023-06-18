# == Schema Information
#
# Table name: products
#
#  id              :bigint           not null, primary key
#  description     :string
#  name            :string
#  position        :integer
#  price           :decimal(, )
#  slug            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  category_id     :bigint
#  stripe_price_id :string
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#  index_products_on_slug         (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:category) { FactoryBot.create(:category, :clothes) }
  let(:product1) { create(:product, :mediocre_wooden_chair) }
  let(:product2) { create(:product, :sleek_concrete_watch) }

  describe "associations" do
    # TODO: it could be should instead of is_expected
    it { is_expected.to belong_to(:category) }
    it { is_expected.to have_many(:product_orders).dependent(:destroy) }
    it { is_expected.to have_many(:orders).through(:product_orders).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
  end

  describe 'friendly_id' do
    it 'should generate a new friendly_id if name changed' do
      original_slug = product1.slug
      product1.name = 'New Product Name'
      product1.save
      expect(product1.slug).not_to eq(original_slug)
    end

    it 'should generate a new friendly_id if slug is blank' do
      product = FactoryBot.create(:product, slug: nil)
      product.save
      expect(product.slug).not_to be_nil
    end
  end

  describe '.find_by_category_slug' do
    let!(:products_home) { FactoryBot.create_list(:product, 10) }
    let!(:products_clothes) { FactoryBot.create_list(:product, 3, category: category) }

    it 'returns products with matching category slug' do
      products = Product.find_by_category_slug(category.slug)
      expect(products).to eq(products_clothes)
      expect(products).not_to include(products_home)
    end
  end
end

