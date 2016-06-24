class CreateUserRockets < ActiveRecord::Migration
  def change
    create_table :user_rockets do |t|
      t.references :user, index: true, foreign_key: true
      t.references :rocket, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
