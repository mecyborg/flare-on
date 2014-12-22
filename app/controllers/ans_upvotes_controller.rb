class AnsUpvotesController < ApplicationController

  
  def new
    @ans_upvote = AnsUpvote.new
    
  end

  def upvote_done
    if params[:email] == current_user.email
       redirect_to :back, :flash => { :danger => "You can't upvote your own answer. That's not fair !" }
     else
  	@ans_upvote = AnsUpvote.new
  	@ans_upvote.ans_id = params[:ans_id]
    @ans_upvote.u_id = params[:from_user]
      
       @add_credit =  Credit.new
        @add_credit.u_id = params[:email]
        @add_credit.ans_id = params[:ans_id]
        @add_credit.uid_from = params[:from_user]
        @add_credit.u_value = "10"

     if @ans_upvote.save
      
      @add_credit.save
      
  		redirect_to :back
    
  	else
  		redirect_to show_ques_path, :flash => { :danger => "Some Error. We are fixit it." }
  	end
    end 
  end

end
