class RemoveAmountLeftFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :amount_left, :integer
  end
end
