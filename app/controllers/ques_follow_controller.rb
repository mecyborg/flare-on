class QuesFollowController < ApplicationController
def new
    @ques_follows = QuesFollow.new
    
  end

  def update_follow
    
  	@ques_follows = QuesFollow.new
  	@ques_follows.q_id = params[:q_id]
    @ques_follows.email = params[:email]
  	if @ques_follows.save
  		redirect_to :back
  	else
  		redirect_to show_ques_path
  	end
    #end 
  end
end
