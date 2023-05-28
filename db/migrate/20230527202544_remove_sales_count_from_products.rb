class RemoveSalesCountFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :sales_count
  end
end
