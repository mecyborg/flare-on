class RemoveDefaultUsername < ActiveRecord::Migration
  def change
  	change_column_default :users, :profile_name, nil
  end
end
