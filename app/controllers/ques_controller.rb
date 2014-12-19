class QuesController < ApplicationController
  def new
    @ques = Ques.new
  end
  def create
  	@ques = Ques.new(ques_params)
  	#@ques_show = "Question" #Ques.find(:id=>1) 
  end

  def ques_params
    params.require(:ques).permit(:Ques,:Category,:Upvote, :follow)
  end
  
  # def create
  #   @ques = Ques.new(ques_params)
  #   if @ques.save
  #     redirect_to root_url, :notice => "Signed up!"
  #   else
  #     render "new"
  #   end
  # end
  # def user_params
  #   params.require(:user).permit(:first_name,:last_name,:email, :password)
  # end
end
