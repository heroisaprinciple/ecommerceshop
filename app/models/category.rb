# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  priority   :integer
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_slug  (slug) UNIQUE
#
class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders, :history]

  has_many :products

  validates :name, presence: true
  validates :priority, presence: true

  scope :ordered, -> { order(priority: :desc) }

  def should_generate_new_friendly_id?
    name_changed? || slug.blank?
  end
end
