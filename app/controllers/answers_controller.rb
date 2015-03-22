class AnswersController < ApplicationController
	before_filter :require_login,  only: [:edit,:update] 
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
 @anyans ||= Answer.exists?(user_id: current_user[:profile_name], question_id: params[:post_quest_id])
  #@myans ||= Answer.find_by(id: session[:user_id])
 # @myans ||= Answer.find_by(user_id: current_user[:profile_name])

 # @myans ||= Answer.find(current_user[:profile_name])

    def allans_show
    @allans_show ||= Answer.where(question_id: params[:id]).order('notifications.created_at ASC').reverse_order #if session[:user_id]
    end

      #render "show"

      
    end

  def create
   @anyques ||= PostQuest.find(params[:post_quest_id])
   @anyans ||= Answer.exists?(user_id: current_user[:profile_name], question_id: params[:post_quest_id])

   unless @anyans 

    
    @newans = Answer.new
     @newans.question_id = params[:post_quest_id]
     @newans.user_id = current_user.profile_name
     answers1 = params[:answer]
     @newans.answer_content = answers1[:answer_content]
     #@newans.answer_content = params[:answer_content]

    if @newans.save
      redirect_to :back, :flash => { :success => "Answer Posted !" }
    
    end 
    else
      redirect_to :back, :flash => { :danger => "Already Posted !" }

    end

  end

  def edit
  @anyans ||= Answer.find_by(id: params[:id])
  if @anyans.blank?
    redirect_to post_quests_path, :flash => { :danger => "Page doesn't exist" }
  else
    unless @anyans.user_id == current_user.profile_name
      redirect_to post_quests_path, :flash => { :danger => "You don't have the permissions" }
    end  
  end
  

  # rescue ActiveRecord::RecordNotFound
  end

  def index
   @anyques ||= Answer.findby(question_id: params[:post_quest_id])

  end
  
  def update
   @anyans ||= Answer.find(params[:id])
    
    if @anyans.update_attributes(addans_params)
            flash[:success] = "Changes saved !"
      
    
      render "edit"
    else
            flash[:danger] = "Error"
      
    end

  end
    
  private
    def addans_params
    params.require(:answer).permit(:answer_content)
   end
    
end
