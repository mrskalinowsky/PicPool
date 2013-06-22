class CreatePools < ActiveRecord::Migration
  def change
    create_table :pools do |t|
      t.string :name
      t.text :description
      t.integer :photo_count
      t.boolean :public

      t.timestamps
      
      t.pool_id :pool_id
    end
  end
end
