class AddIndicesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :first_name
    add_index :users, :last_name
    add_index :users, :email

    change_column_null :users, :first_name, false
    change_column_null :users, :last_name, false
    change_column_null :users, :email, false
    change_column_null :users, :password_digest, false
  end
end
