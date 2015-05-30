class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :getid 
  helper_method :getusername
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
 # helper_method :credits_show
  helper_method :postques_show
  helper_method :anyans
  #helper_method :credits_info
 # helper_method :login_redirect
  helper_method :followed_ques
  helper_method :postques_show_sidebar
  helper_method :allnoti_show
  helper_method :require_login
  helper_method :is_admin?
  helper_method :redirect_admin
  #helper_method :online?

  

protect_from_forgery with: :null_session 

#before_filter :require_login,  only: [:edit, :update] 

#after_filter :user_activity       #who is online
def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    #rescue ActiveRecord::RecordNotFound
  end

def getid(email)
    getid = User.where(:email => email).pluck(:id).first
    
  end

  def getusername(id)
    getuesrname = User.where(:id => id).pluck(:profile_name).first
  end

  private
  
    # def admin_user?
    # @admin_user ||= User.where(email: current_user[:email])
    
    # # if @admin_user == true
    # #   #render "index"
    # #   @admin_user_true == true
    # # else
    # #   #render
    # #   @admin_user_true == false
    # # end
    # end


  # def user_activity
  # current_user.try :touch
  # end

  #scope :online, lambda{ where("updated_at > ?", 10.minutes.ago) }
    



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
   
    
    # def login_redirect
    #     #flash[:notice] = 'Successfully checked in'
    #    redirect_to log_in_path, :flash => { :danger => "Please Login" }
    # end

    def followed_ques
    @followed_ques ||= QuesFollow.where(email: current_user[:email])
    end


    def ans_upvote_count
    @ans_upvote_count ||= AnsUpvote.find_by(id: params[:id]).count
    end

    def allnoti_show
    @allnoti_show ||= Notification.where(user_to: current_user[:id])
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
