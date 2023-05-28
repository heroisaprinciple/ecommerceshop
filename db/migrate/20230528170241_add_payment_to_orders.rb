class AddPaymentToOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :payment, null: false, foreign_key: true
  end
end
