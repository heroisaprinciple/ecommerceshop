# == Schema Information
#
# Table name: addresses
#
#  id         :bigint           not null, primary key
#  city       :string
#  comment    :text
#  country    :string
#  street     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_addresses_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Address < ApplicationRecord
  belongs_to :user, optional: true # to create records that might not belong to user
  has_one :order_detail, dependent: :destroy

  validates :country, presence: true, length: { maximum: 56 }
  validates :city, presence: true, length: { maximum: 40 }
  validates :street, presence: true, length: { maximum: 40 }
end
