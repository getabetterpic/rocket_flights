class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.citext :email, null: false

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
  end
end
