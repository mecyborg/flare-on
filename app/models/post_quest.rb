class PostQuest < ActiveRecord::Base
	validates_presence_of :ques_text
	validates_presence_of :t_id
  	#validates_presence_of :last_name
  	belongs_to :alltopics
  	has_many :answers, dependent: :destroy
  	accepts_nested_attributes_for :answers
end
