class Address < ApplicationRecord
  belongs_to :user, optional: true # to create records that might not belong to user
  has_one :order_detail, dependent: :destroy

  validates :country, presence: true, length: { maximum: 56 }
  validates :city, presence: true, length: { maximum: 40 }
  validates :street, presence: true, length: { maximum: 40 }
end
