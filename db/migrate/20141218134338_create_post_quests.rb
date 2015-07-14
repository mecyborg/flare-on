class CreatePostQuests < ActiveRecord::Migration
  def change
    create_table :post_quests do |t|
    	 t.string :ques_text

      # t.string :ques_text

      t.string :t_id
      t.string :first
      t.string :upvote
      t.string :follow

      t.timestamps
    end
  end
end
