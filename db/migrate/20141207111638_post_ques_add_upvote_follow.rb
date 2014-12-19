class PostQuesAddUpvoteFollow < ActiveRecord::Migration
  def change
    add_column :post_ques, :upvote, :boolean,:default => false 
    add_column :post_ques, :follow, :boolean,:default => false 

  end
end
