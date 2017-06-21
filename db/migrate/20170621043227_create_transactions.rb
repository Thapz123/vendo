class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.integer :maker_id, null: false
      t.integer :recipient_id, null: false
      t.decimal :amount, null: false, precision: 12, scale: 2
      t.text    :memo, null: false, limit: 200
      t.string  :status, null: false, default: 'pending'
      t.string  :visibility, null: false, default: 'public'

      t.timestamps
    end

    add_index :transactions, :maker_id
    add_index :transactions, :recipient_id
  end
end
