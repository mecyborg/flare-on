class PostQuest < ActiveRecord::Base
	validates_presence_of :ques_text
	validates_presence_of :t_id
  	#validates_presence_of :last_name
end
