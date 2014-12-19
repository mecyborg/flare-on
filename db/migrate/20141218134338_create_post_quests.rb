class CreatePostQuests < ActiveRecord::Migration
  def change
    create_table :post_quests do |t|

     t.timestamps
    end
  end
end
