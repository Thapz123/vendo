class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.integer :requester_id, null: false
      t.integer :responder_id, null: false
      t.string  :status, null: false, default: 'pending'

      t.timestamps
    end

    add_index :friendships, :requester_id
    add_index :friendships, :responder_id
    add_index :friendships, [:requester_id, :responder_id], unique: true
  end
end
