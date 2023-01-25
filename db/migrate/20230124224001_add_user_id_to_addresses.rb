class AddUserIdToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_reference :addresses, :users, null: false, foreign_key: true
  end
end
