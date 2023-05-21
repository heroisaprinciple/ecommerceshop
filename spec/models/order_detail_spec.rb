# == Schema Information
#
# Table name: order_details
#
#  id         :bigint           not null, primary key
#  email      :string
#  firstname  :string
#  lastname   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  address_id :bigint           not null
#  order_id   :bigint           not null
#
# Indexes
#
#  index_order_details_on_address_id  (address_id)
#  index_order_details_on_order_id    (order_id)
#
# Foreign Keys
#
#  fk_rails_...  (address_id => addresses.id)
#  fk_rails_...  (order_id => orders.id)
#
require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:order) }
    it { is_expected.to belong_to(:address) }
  end

  describe 'nested attributes' do
    it { is_expected.to accept_nested_attributes_for(:address) }
  end
end

