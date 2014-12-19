class AddQuestionTableColumns < ActiveRecord::Migration
  def change
    add_column :post_ques, :ques_text, :string
    add_column :post_ques, :t_id, :integer
    add_column :post_ques, :first, :string,:default => 'NO' 
  end
end
