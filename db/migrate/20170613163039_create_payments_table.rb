class CreatePaymentsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :payments_tables do |t|
      t.integer :maker_id, null: false
      t.integer :recipient_id, null: false
      t.decimal :amount, scale: 12, precision: 2
      t.text    :memo, null: false, limit: 200
      t.string  :visibility, null: false, default: 'public'

      t.timestamps
    end
  end
end
