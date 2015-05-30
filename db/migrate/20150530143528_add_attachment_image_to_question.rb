class AddAttachmentImageToQuestion < ActiveRecord::Migration
  def self.up
    change_table :post_quests do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :post_quests, :avatar
  end
end
