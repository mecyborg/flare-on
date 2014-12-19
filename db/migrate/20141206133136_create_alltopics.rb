class CreateAlltopics < ActiveRecord::Migration
  def change
    create_table :alltopics do |t|
    	t.column "t_id", :integer
    	t.column "t_name", :string
      t.timestamps
    end
  end
end
