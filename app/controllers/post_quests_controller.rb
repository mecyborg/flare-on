class PostQuestsController < ApplicationController
 
  def new
    @postquest = PostQuest.new
  end

  def create
    @postquest = PostQuest.new(postquest_params)
    if @postquest.save
      redirect_to show_quest_path, :flash => { :success => "Question Posted !" }
    
    #	render'index'
    else
      render "new"
    end
  end
  def postquest_params
    params.require(:post_quest).permit(:ques_text,:t_id,:first)
  end

  

  # def newans
  #   @newans = Answers.new
    
  #   end

  # def add_ans
  #   @newans = Answers.new(addans_params)
  #   # @newans.question_id = params[:q_id]
  #   # @newans.user_id = params[:email]
  #   # @newans.answer_content = :answer_content
  #   def postques_params
  #   params.require(:answers).permit(:question_id,:user_id,:answer_content)
  #  end
  #   if @newans.save
  #     redirect_to :back
  #   else
  #     redirect_to show_ques_path
  #   end 
  # end
  
end
