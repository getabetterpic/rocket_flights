class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.citext :email, index: true, unique: true, null: false

      t.timestamps null: false
    end
  end
end
