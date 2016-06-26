class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :imageable_id
      t.string :imageable_type

      t.timestamps null: false
    end

    add_index :images, :imageable_id
    add_attachment :images, :image
  end
end
