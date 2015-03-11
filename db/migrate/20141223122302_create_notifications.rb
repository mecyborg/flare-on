class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :user_to
      t.string :user_from
      t.string :noti_type

      t.timestamps
    end
  end
end
