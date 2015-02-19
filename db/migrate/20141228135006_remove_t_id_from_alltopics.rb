class RemoveTIdFromAlltopics < ActiveRecord::Migration
  def up
  	remove_column :alltopics, :t_id
  end
  def down
  	add_column :alltopics, :t_id
  end
end
