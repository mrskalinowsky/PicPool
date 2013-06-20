class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string   "photo_file_name"
      t.string   "photo_content_type"
      t.integer  "photo_file_size"
      t.datetime "photo_updated_at"
      t.timestamps
      t.integer :pool_id
    end
  end
  add_index :photos, [:pool_id, :created_at]
end