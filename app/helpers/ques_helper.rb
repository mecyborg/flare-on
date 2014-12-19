module QuesHelper
def ques_show
    @ques_show ||= Ques.all #if session[:user_id]
  	end
end
