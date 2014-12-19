class AnswersController < ApplicationController
	
	def new
    @newans = Answer.new
    
    end

  def create
    @newans = Answer.new(addans_params)
    # @newans.question_id = params[:q_id]
    # @newans.user_id = params[:email]
    # @newans.answer_content = :answer_content
    if @newans.save
      redirect_to show_quest_path
    else
      redirect_to show_quest_path
    end 
  end
    
    def addans_params
    params.require(:answer).permit(:question_id,:user_id,:answer_content)
   end
    
end
