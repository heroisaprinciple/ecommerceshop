class ChangeStatusTypeInPayments < ActiveRecord::Migration[7.0]
  def up
    change_column :payments, :status, :integer, using: 'status::integer'
  end

  def down
    change_column :payments, :status, :string
  end
end
