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
class ProductIterator
  include Enumerable

  attr_reader :collection, :type

  def initialize(collection, type = :price)
    @collection = collection
    @type = type
  end

  def map(&block)
    return @collection.order(:price).map(&block) if @type == :price
    return @collection.order(:created_at).map(&block) if @type == :created
    return @collection.order(:name).map(&block) if @type == :name

    raise(ArgumentError, "Incorrect type")
  end
end
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

  def price_iterator
    ProductIterator.new(self.products, :price)
  end

  def created_at_iterator
    ProductIterator.new(self.products, :created)
  end

  def name_iterator
    ProductIterator.new(self.products, :name)
  end
end
