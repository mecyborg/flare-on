class CreateAnswerUpvotes < ActiveRecord::Migration
  def change
    create_table :answer_upvotes do |t|
      t.string :answer_id
      t.string :user_id

      t.timestamps
    end
  end
end
