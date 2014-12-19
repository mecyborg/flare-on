class Alltopic < ActiveRecord::Base
	validates_presence_of :t_id
	validates_presence_of :t_name
end
