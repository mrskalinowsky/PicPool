class CreatePools < ActiveRecord::Migration
  def change
    create_table :pools do |t|
      t.string :name
      t.string :description
      t.integer :cover

      t.timestamps
    end
  end
end
