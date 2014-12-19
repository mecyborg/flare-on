class CreateTopicFollows < ActiveRecord::Migration
  def change
    create_table :topic_follows do |t|
      t.integer :t_id
      t.string :email

      t.timestamps
    end
  end
end
