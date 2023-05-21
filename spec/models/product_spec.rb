# == Schema Information
#
# Table name: products
#
#  id              :bigint           not null, primary key
#  amount_left     :integer
#  description     :string
#  name            :string
#  price           :decimal(, )
#  sales_count     :integer          default(0), not null
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

  describe ".paginate_order" do
    it "returns all products" do
      expect(Product.paginate_order).to include(product1, product2)
    end
  end
end

