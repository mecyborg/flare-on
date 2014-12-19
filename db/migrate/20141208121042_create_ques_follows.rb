class CreateQuesFollows < ActiveRecord::Migration
  def change
    create_table :ques_follows do |t|
      t.integer :q_id
      t.string :email

      t.timestamps
    end
  end
end
