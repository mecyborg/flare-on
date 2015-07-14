class Alltopic < ActiveRecord::Base
	 # validates_presence_of :t_id
	 validates_presence_of :t_name

	 has_many :post_quests, foreign_key: :id
end
