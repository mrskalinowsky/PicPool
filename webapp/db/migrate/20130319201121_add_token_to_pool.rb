class AddTokenToPool < ActiveRecord::Migration
  def change
    add_column :pools, :token, :string
  end
end
