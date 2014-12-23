class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :user
      t.string :user_from
      t.string :type

      t.timestamps
    end
  end
end
