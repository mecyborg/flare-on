class AnsUpvotesController < ApplicationController
  before_filter :require_login
  
  
  def new
    #@ans_upvote = AnsUpvote.new
    
 # end

#  def upvote_done
    # if params[:answer_user_id] == current_user.email
    #    redirect_to :back, :flash => { :danger => "You can't upvote your own answer. That's not fair !" }
    #  else
    @ansdetails = Answer.find(params[:answer_id])
    uid_from1 = current_user.profile_name
  	@ans_upvote = AnsUpvote.new
  	@ans_upvote.ans_id = params[:answer_id]
    
    @ans_upvote.u_id = current_user.profile_name
      
       @add_credit =  Credit.new
        @add_credit.u_id = @ansdetails.user_id
        @add_credit.ans_id = @ansdetails.id
        @add_credit.uid_from = uid_from1
        @add_credit.u_value = "10"

        @add_noti =  Notification.new
        @add_noti.user_to = @ansdetails.user_id
        @add_noti.user_from = uid_from1
        @add_noti.noti_type = "upvote"
        @add_noti.ans_id = @ansdetails.id
        #@add_noti.u_value = "10"

    if @ans_upvote.save
      
      @add_credit.save
      @add_noti.save
      
  		redirect_to :back, :flash => { :success => "Upvoted." }
    
  	else
  		redirect_to show_ques_path, :flash => { :danger => "Some Error. We are fixing it." }
  	end
    
    end 
 # end

end
