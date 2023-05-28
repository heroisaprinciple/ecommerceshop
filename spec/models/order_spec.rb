# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  ordered_at :datetime
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  payment_id :bigint           not null
#  user_id    :bigint
#
# Indexes
#
#  index_orders_on_payment_id  (payment_id)
#  index_orders_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (payment_id => payments.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { create(:order) }
  describe "enums" do
    it { is_expected.to define_enum_for(:status).with_values(pending: 0, complete: 1, canceled: 2) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:product_orders).dependent(:destroy) }
    it { is_expected.to have_many(:products).through(:product_orders) }
    it { is_expected.to have_one(:order_detail).dependent(:destroy) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:ordered_at) }
  end

  describe "default attributes" do
    it "sets the default status to 'pending'" do
      expect(order.status).to eq('0')
    end
  end

  describe "nested attributes" do
    it { is_expected.to accept_nested_attributes_for(:order_detail) }
  end
end

