class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :fb_uid, :string
    add_column :users, :fb_name, :string
  end
end
