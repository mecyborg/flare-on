class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session 
  before_filter :require_login,  only: [:edit,:update] 

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
 # helper_method :allans_show
  helper_method :credits_show
  helper_method :postques_show
  helper_method :anyans
  helper_method :credits_info
 # helper_method :login_redirect
  helper_method :followed_ques
  helper_method :postques_show_sidebar
  helper_method :allnoti_show
  helper_method :require_login
  helper_method :is_admin?
  helper_method :redirect_admin
  #helper_method :online?
  helper_method :user_name
  helper_method :user_avatar

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def user_name (email)
     # @username ||= User.where("email = ?", email).profile_name
      @user_name ||= User.where("email = ?", email).pluck(:profile_name).first

    end
    
    def user_avatar(profile_name)
      @user_avatar = User.find_by(profile_name: profile_name).avatar
    end

  private    

    def require_login
      unless current_user
        redirect_to log_in_path, :flash => { :danger => "Please Login or Sign Up First." }
      end
    end

  	def postques_show_sidebar
      @postques_show_sidebar ||= PostQuest.last(2)  
    end 

    def user_follow_ques
      @user_follow_ques ||= QuesFollow.exists?(q_id: params[:id])
    end

    #remove 'not' when heroku problem is fixed
   
    def credits_show
      @credits_show ||= Credit.where(u_id: current_user[:profile_name]).sum(:u_value)  
    end

    def credits_info
      @credits_info ||= Credit.where(u_id: current_user[:profile_name]).order('notifications.created_at ASC').reverse_order.where.not(uid_from: "new_user_bonus")
    end

    def followed_ques
      @followed_ques ||= QuesFollow.where(email: current_user[:email])
    end


    def ans_upvote_count
      @ans_upvote_count ||= AnsUpvote.find_by(id: params[:id]).count
    end

    def allnoti_show
      @allnoti_show ||= Notification.where(user_to: current_user[:profile_name]).order('notifications.created_at ASC').reverse_order #if session[:user_id]
    end

    def is_admin?
      if current_user.admin_role?
        return true
      else
        return false
      end
    end

    def redirect_admin
      redirect_to myprofile_path, :flash => { :danger => "It's hell there! Stay Away." }
    end
end
