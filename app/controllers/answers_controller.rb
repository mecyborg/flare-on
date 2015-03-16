class AnswersController < ApplicationController
	
	helper_method :allans_show

  def allans_show
    @allans_show ||= Answer.where(question_id: params[:post_quest_id]).order('notifications.created_at ASC').reverse_order #if session[:user_id]
    end


  def new
    #@newans = Answer.new
   @anyques ||= PostQuest.find(params[:post_quest_id])
    @newans = Answer.new
    respond_with(@anyques)
    end

    def show
  # @anyques ||= Answer.where(question_id: params[:id])
  #@anyans ||= Answer.find(params[:id])
    def allans_show
    @allans_show ||= Answer.where(question_id: params[:id]).order('notifications.created_at ASC').reverse_order #if session[:user_id]
    end

      #render "show"

      
    end

  def create
   @anyques ||= PostQuest.find(params[:post_quest_id])

    @newans = Answer.new
     @newans.question_id = params[:post_quest_id]
     @newans.user_id = current_user.email
     answers1 = params[:answer]
     @newans.answer_content = answers1[:answer_content]
     #@newans.answer_content = params[:answer_content]

    if @newans.save
      redirect_to :back, :flash => { :success => "Answer Posted !" }
    

    
    end 
  end

  def edit
   @anyans ||= Answer.find(params[:id])
    rescue ActiveRecord::RecordNotFound
  
  end

  def index
   @anyques ||= Answer.findby(question_id: params[:post_quest_id])

  end
  
  def update
   @anyans ||= PostQuest.find(params[:id])
    
    # if @user.update_attributes(user_params)
    #         flash[:success] = "Profile updated! Feeling Refreshed already."
    #   #:flash => { :success => "Profile Updated! Feeling Refreshed already." }
    #   render "edit"
    # else
    #   render "edit"
    # end

  end
    
   #  def addans_params
   #  params.require(:answer).permit(:answer_content)
   # end
    
end
