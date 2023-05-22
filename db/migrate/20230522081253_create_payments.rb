class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :status
      t.float :sum
      t.string :payment_method, default: 'card'
      t.references :user, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
      t.datetime :paid_at

      t.timestamps
    end
  end
end
