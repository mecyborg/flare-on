class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  helper_method :ques_show
  helper_method :allusers_show
  helper_method :userprofile
  helper_method :alltopics_show
  helper_method :anytopic
  helper_method :topic_ques
  helper_method :user_follow
  helper_method :anyques
  helper_method :user_follow_ques
  helper_method :allans_show
  helper_method :credits_show
  helper_method :postques_show
  helper_method :anyans
  helper_method :credits_info
  helper_method :login_redirect






  
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
  end

	
    def ques_show
    @ques_show ||= Ques.all #if session[:user_id]
  	end

  	def userprofile
    @userprofile ||= User.find_by(email: params[:email])
  	end

  	def allusers_show
    @allusers_show ||= User.all #if session[:user_id]
  	end

    def postques_show
      @postques_show ||= PostQuest.all  
    end  

  	def alltopics_show
    @alltopics_show ||= Alltopic.all #if session[:user_id]
  	end

    def anytopic
    @anytopic ||= Alltopic.find_by(t_id: params[:t_id])
    end

    def anyques
    @anyques ||= PostQuest.find_by(id: params[:id])
    end

    def user_follow_ques
      @user_follow_ques ||= QuesFollow.exists?(q_id: params[:id])
    end

    def allans_show
    @allans_show ||= Answer.where(question_id: params[:id]).where.not(id: "1") #if session[:user_id]
    end

    #remove 'not' when heroku problem is fixed
   
    def credits_show
    @credits_show ||= Credit.where(u_id: current_user[:email]).sum(:u_value)  
    end

    def credits_info
    @credits_info ||= Credit.where(u_id: current_user[:email]).where.not(uid_from: "new_user_bonus")
    end

    def login_redirect
        #flash[:notice] = 'Successfully checked in'
       redirect_to log_in_path, :flash => { :danger => "Please Login" }
    end



    # def user_follow_ques
    #   @user_follow_ques ||= QuesFollow.exists?(q_id: params[:q_id])
    # end

    # def ans_upvoted
    # @ans_upvoted ||= AnsUpvote.exists?(u_id: session[:user_id] AND ans_id: user.id) if session[:user_id]
    # end

    def ans_upvote_count
    @ans_upvote_count ||= AnsUpvote.find_by(id: params[:id]).count
    end


end
