# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  priority   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'
require 'factory_bot'

RSpec.describe Category, type: :model do
  describe "association" do
    it { is_expected.to have_many(:products) }
  end

  describe "scopes" do
    describe ".ordered" do
      let!(:category1) { create(:category, :other, priority: 2) }
      let!(:category2) { create(:category, :home, priority: 1) }
      let!(:category3) { create(:category, :clothes, priority: 3) }
      it "returns categories ordered by priority in descending order" do
        # TODO: show on refactoring lesson (using let helper is a better practice)
        # category1 = create(:category, priority: 2)
        # category2 = create(:category, priority: 1)
        # category3 = create(:category, priority: 3)
        binding.pry

        ordered_categories = Category.ordered

        expect(ordered_categories).to eq([category3, category1, category2])
      end
    end
  end
end


