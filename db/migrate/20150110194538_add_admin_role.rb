class AddAdminRole < ActiveRecord::Migration
  def up
 	  add_column :users, :admin_role, :boolean, default: false
 	 # add_column :users, :acivation, :boolean
 end

  def down
  	 remove_column :users, :admin_role, :boolean
  end
end
