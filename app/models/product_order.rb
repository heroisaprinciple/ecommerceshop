class ProductOrder < ApplicationRecord
  belongs_to :order
  belongs_to :product

  attribute :amount, :integer, default: 1
end
