class CreatePools < ActiveRecord::Migration
  def change
    create_table :pools do |t|
      t.string :name
      t.text :description
      t.boolean :public

      t.timestamps
      
      t.pool_id :pool_id
      t.user_id :user_id
    end
  end
end
