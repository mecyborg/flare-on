class AddPicture < ActiveRecord::Migration
  def change
  	 add_column :users, :picture, :string
  	 add_column :users, :bio, :string
  end
end
