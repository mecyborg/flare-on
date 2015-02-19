class AddNameToUser < ActiveRecord::Migration
  def up
  	add_column :users, :name, :string
  	#add_column :users, :acivation, :boolean
  end
  def down
  	remove_column :users, :name, :string
  end
end
