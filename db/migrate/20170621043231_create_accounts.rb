class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.integer :owner_id, null: false
      t.decimal :balance, null: false, precision: 12, scale: 2
    end

    add_index :accounts, :owner_id, unique: true
  end
end
