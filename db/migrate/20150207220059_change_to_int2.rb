class ChangeToInt2 < ActiveRecord::Migration
  def change
  	 change_column :answers, :question_id, 'integer USING CAST(question_id AS integer)'
  end
end
