class Answer < ActiveRecord::Base
	validates_presence_of :answer_content
end
