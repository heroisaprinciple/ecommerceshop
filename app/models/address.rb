class Address < ApplicationRecord
  belongs_to :user, optional: true # to create records that might not belong to user
  has_one :order_detail

  validates :country, presence: true, length: { minimum: 4, maximum: 56 }
  validates :city, presence: true, length: { minimum: 4, maximum: 40 }
  validates :street, presence: true, length: { minimum: 3, maximum: 40 }
end
