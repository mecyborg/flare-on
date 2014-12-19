class CreateQues < ActiveRecord::Migration
  def up
    create_table :ques do |t|
    	t.column "Ques", :string
    	t.column "Category", :string
    	t.column "Upvote", :boolean
    	t.column "follow", :boolean
    	#t.datetime "created_at"
    	#t.datetime "created_at"

      t.timestamps
    end
  end

  def down
  	drop_table :ques
  end
end
