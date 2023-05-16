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
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  category_id     :bigint
#  stripe_price_id :string
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class Product < ApplicationRecord
  paginates_per 6

  belongs_to :category
  has_many :product_orders, dependent: :destroy
  has_many :orders, through: :product_orders, dependent: :destroy

  scope :paginate_order, -> {select("*")}
end
