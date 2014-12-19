class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer_id
      t.string :question_id
      t.string :user_id
      t.string :answer_content

      t.timestamps
    end
  end
end
