class AddPoolTokenToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :pool_token, :string
  end
end
