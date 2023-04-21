class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :address

  accepts_nested_attributes_for :address
end
