class AnsUpvotesController < ApplicationController

  
  def new

#  def upvote_done
    # if params[:answer_user_id] == current_user.email
    #    redirect_to :back, :flash => { :danger => "You can't upvote your own answer. That's not fair !" }
    #  else
   @ansdetails = Answer.find(params[:answer_id])
    @u_id_to = @ansdetails.user_id
    
  
    upvote_answer
    create_notification
    add_upvote_credits

    if @ans_upvote.save
      
      @add_credit.save
      @add_noti.save
      
  		redirect_to :back, :flash => { :success => "Upvoted." }
    
  	else
  		redirect_to show_ques_path, :flash => { :danger => "Some Error. Please Try Again!" }
  	end
 
    
  end 
     
  private
     
    def upvote_answer
      @ans_upvote = AnsUpvote.new
      @ans_upvote.ans_id = @ansdetails.id
      @ans_upvote.u_id = current_user.id
    end

   

    def create_notification
      @add_noti =  Notification.new
      @add_noti.user_to = @u_id_to
      @add_noti.user_from = current_user.id
      @add_noti.noti_type = "upvote"
      @add_noti.ans_id = @ansdetails.id
    end

    def add_upvote_credits
      @add_credit =  Credit.new
      @add_credit.u_id = @u_id_to
      @add_credit.ans_id = @ansdetails.id
      @add_credit.uid_from = current_user.id
      @add_credit.u_value = "10"
    end
end
