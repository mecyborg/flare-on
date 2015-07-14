class RemoveAnsId < ActiveRecord::Migration
  def change
  	 remove_column :answers, :answer_id
  end
end
