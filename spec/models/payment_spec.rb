# == Schema Information
#
# Table name: payments
#
#  id             :bigint           not null, primary key
#  paid_at        :datetime
#  payment_method :string
#  status         :integer
#  sum            :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  cart_id        :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_payments_on_cart_id  (cart_id)
#  index_payments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:paid_at) }
    it { is_expected.to validate_presence_of(:sum) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:cart) }
  end

  describe 'enums' do
    it { is_expected.to define_enum_for(:status).with_values(unpaid: 0, paid: 1, canceled: 2) }
  end
end
