class AnswersController < ApplicationController
	
	


  def new
    #@newans = Answer.new
   @anyques ||= PostQuest.find(params[:post_quest_id])
    @newans = Answer.new
    respond_with(@anyques)
    end

    def show
  # @anyques ||= Answer.where(question_id: params[:id])
  #@anyans ||= Answer.find(params[:id])
    

      #render "show"

      
    end

  def create
   @anyques = PostQuest.find(params[:post_quest_id])
   @anyans = Answer.exists?(user_id: current_user[:id], question_id: params[:post_quest_id])

   unless @anyans 

    
    @newans = Answer.new
     @newans.question_id = params[:post_quest_id]
     @newans.user_id = current_user.id
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
  @anyans = Answer.find_by(id: params[:id])
  if @anyans.blank? || (@anyans.user_id.to_s != current_user.id.to_s)
    redirect_to post_quests_path, :flash => { :danger => "Page doesn't exist" }
  # else
  #   unless 
  #     redirect_to post_quests_path, :flash => { :danger => "You don't have the permissions" }
  #   end  
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
