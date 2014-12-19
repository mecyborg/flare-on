class CreatePostAttachments < ActiveRecord::Migration
  def change
    create_table :post_attachments do |t|
      t.integer :user_id
      t.string :avatar

      t.timestamps
    end
  end
end
