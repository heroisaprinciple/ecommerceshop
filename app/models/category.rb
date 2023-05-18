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
class Category < ApplicationRecord
  has_many :products

  validates :name, presence: true
  validates :priority, presence: true

  scope :ordered, -> {order(priority: :desc)}
end
