# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  priority   :integer
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_slug  (slug) UNIQUE
#
require 'rails_helper'

RSpec.describe Category, type: :model do
  let!(:category1) { create(:category, :other, priority: 2) }
  let!(:category2) { create(:category, priority: 1) }
  let!(:category3) { create(:category, :clothes, priority: 3) }

  describe "association" do
    it { is_expected.to have_many(:products) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:priority) }
  end

  describe "scopes" do
    describe ".ordered" do
      it "returns categories ordered by priority in descending order" do
        ordered_categories = Category.ordered
        expect(ordered_categories).to eq([category3, category1, category2])
      end
    end
  end

  describe 'friendly_id' do
    it 'should generate a new friendly_id if name changed' do
      original_slug = category1.slug
      category1.name = 'New Product Name'
      category1.save
      expect(category1.slug).not_to eq(original_slug)
    end

    it 'should generate a new friendly_id if slug is blank' do
      category = FactoryBot.create(:category, slug: nil)
      category.save
      expect(category.slug).not_to be_nil
    end
  end
end


