# Answers model
class Answer < ActiveRecord::Base
  validates_presence_of :answer_content
  belongs_to :post_quests
  belongs_to :user
  has_many :ans_upvotes, dependent: :destroy
  accepts_nested_attributes_for :ans_upvotes
end
