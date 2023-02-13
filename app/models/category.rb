class Category < ApplicationRecord
  has_many :products

  scope :ordered, -> {order(priority: :desc)}
end
