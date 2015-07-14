class ChangeToInt < ActiveRecord::Migration
  def change
  	 change_column :ans_upvotes, :ans_id, 'integer USING CAST(ans_id AS integer)'
  end
end
