class CreatePostQuests < ActiveRecord::Migration
  def change
    create_table :post_quests do |t|
<<<<<<< HEAD
    	t.string :ques_text
=======
    t.string :ques_text
>>>>>>> 32ac0acafa1c493906701608c2802ea0c853cd02
      t.string :t_id
      t.string :first
      t.string :upvote
      t.string :follow
<<<<<<< HEAD

=======
>>>>>>> 32ac0acafa1c493906701608c2802ea0c853cd02
     t.timestamps
    end
  end
end
