class PostQuest < ActiveRecord::Base
	validates_presence_of :ques_text
	validates_presence_of :t_id
  	#validates_presence_of :last_name
  	belongs_to :alltopics
  	has_many :answers, dependent: :destroy
  	accepts_nested_attributes_for :answers
  	has_attached_file :avatar, :styles => { :banner => "600x340>", :thumb => "348x196>", :tiny => "223x126>" }, 
  :url => "/system/post_quests/:id_partition/:style/:hash.:extension",
    :hash_secret => "akfahudagwlgauwgiualsdauyingacbbahdgkabshdabdsga",
  :default_url => "default_quest/:style/default_banner.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
	