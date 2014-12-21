class ChangeToInt < ActiveRecord::Migration
  def change
  	change_column :ans_upvotes, :ans_id, :integer
  end
end
