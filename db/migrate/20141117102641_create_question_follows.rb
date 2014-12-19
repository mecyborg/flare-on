class CreateQuestionFollows < ActiveRecord::Migration
  def change
    create_table :question_follows do |t|
      t.string :question_id
      t.string :user_id

      t.timestamps
    end
  end
end
