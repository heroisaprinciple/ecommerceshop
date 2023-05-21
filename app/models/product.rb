# == Schema Information
#
# Table name: products
#
#  id              :bigint           not null, primary key
#  amount_left     :integer
#  description     :string
#  name            :string
#  price           :decimal(, )
#  sales_count     :integer          default(0), not null
#  slug            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  category_id     :bigint
#  stripe_price_id :string
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#  index_products_on_slug         (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders, :history]

  paginates_per 6

  belongs_to :category
  delegate :slug, to: :category, prefix: true

  has_many :product_orders, dependent: :destroy
  has_many :orders, through: :product_orders, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  scope :find_by_category_slug, ->(slug) { select { |p| p.category_slug == slug } }

  def should_generate_new_friendly_id?
    name_changed? || slug.blank?
  end
end
