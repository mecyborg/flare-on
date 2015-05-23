class TopicFollowsController < ApplicationController
  before_filter :require_login
  
  def new
    @topic_follows = TopicFollow.new
    
  end

  def update_follow
  	@topic_follows = TopicFollow.new
  	@topic_follows.t_id = params[:t_id]
    @topic_follows.email = params[:email]
  	if @topic_follows.save
  		redirect_to show_topics_path
  	else
  		redirect_to show_topics_path
  	end 
  end

  
  
end
