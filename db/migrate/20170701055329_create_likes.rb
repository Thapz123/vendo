class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :transaction_id, null: false
      t.integer :user_id, null: false
      t.boolean :active, null: false, default: true

      t.timestamps null: false
    end

    add_index :likes, :user_id
    add_index :likes, :transaction_id
  end
end
