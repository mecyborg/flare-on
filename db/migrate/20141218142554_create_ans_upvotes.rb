class CreateAnsUpvotes < ActiveRecord::Migration
  def change
    create_table :ans_upvotes do |t|
    	 t.string :u_id
      t.string :ans_id
      t.timestamps
    end
  end
end
