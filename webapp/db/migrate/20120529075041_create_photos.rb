class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :description
      t.string :image
      t.integer :pool_id

      t.timestamps
    end
  end
end
