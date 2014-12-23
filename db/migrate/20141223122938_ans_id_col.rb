class AnsIdCol < ActiveRecord::Migration
  def change
  	add_column :notifications, :ans_id, :string
  end
end
