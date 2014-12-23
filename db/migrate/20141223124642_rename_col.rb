class RenameCol < ActiveRecord::Migration
  def change
  	rename_column :notifications, :user, :user_to
  	rename_column :notifications, :type, :noti_type

  end
end
