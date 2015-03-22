class PostQuestsController < ApplicationController
before_filter :require_login,  only: [:show,:edit,:update] 
helper_method :allans_show

  def allans_show
    @allans_show ||= Answer.where(question_id: params[:id]).order('notifications.created_at ASC').reverse_order
    end

  def new
    @postquest = PostQuest.new
  end

  def create
    @postquest = PostQuest.new(postquest_params)
    if @postquest.save
      redirect_to post_quests_path(@alltopic), :flash => { :success => "Question Added" }
      
    #	render'index'
    else
      render "new"
    end
  end
  def postquest_params
    params.require(:post_quest).permit(:ques_text,:t_id,:first)
  end

  def index           #all ques index
    @post_quests = PostQuest.paginate(page: params[:page], :per_page => 5)
  end 

    

     def anyques      #individual topic page
    @anyques ||= PostQuest.find(params[:id])
    end
  
  def show
   
   @anyques ||= PostQuest.find(params[:id])
   #@anyans ||= Answer.exists?(user_id: current_user[:email], question_id: params[:post_quest_id])
   
    @myans ||= Answer.find_by(user_id: current_user[:profile_name])
 
  
  
    
  end

  
  

  # def newans
  #   @newans = PostQues.Answers.new
    
  #   end

  def add_ans
    @newans = Answers.new(addans_params)
    # @newans.question_id = params[:q_id]
    # @newans.user_id = params[:email]
    # @newans.answer_content = :answer_content
    def postques_params
    params.require(:answers).permit(:question_id,:user_id,:answer_content)
   end
    if @newans.save
      redirect_to :back
    else
      redirect_to show_ques_path
    end 
  end
  
end
