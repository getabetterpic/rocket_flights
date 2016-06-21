class AddAuth0UserIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :auth0_user_id, :string
    add_index :users, [:auth0_user_id, :email], unique: true
  end
end
