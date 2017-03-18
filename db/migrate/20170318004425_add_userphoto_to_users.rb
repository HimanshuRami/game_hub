class AddUserphotoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :userphoto, :image
  end
end
