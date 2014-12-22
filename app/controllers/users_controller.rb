class UsersController < ApplicationController
  # before_action :logged_in_user, only: [:edit, :update]
    before_action :correct_user,   only: [:edit, :update]  
  # def logged_in_user
  #     unless logged_in?
  #       flash[:danger] = "Please log in."
  #       redirect_to log_in_path
  #     end
  #   end
  #skip_before_filter :require_login
  def correct_user        #to ensure current user does the edit (url manilpulation)
      @user = User.find(params[:id])
      redirect_to(profile_url) unless @user == current_user
      
    end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)

        # @add_credit =  Credit.new
        # @add_credit.u_id = params[:u_id]       #Not working correctly
        # @add_credit.ans_id = "new_user_bonus"
        # @add_credit.uid_from = "new_user_bonus"
        # @add_credit.u_value = "50"
    if @user.save
      # @add_credit.save
      redirect_to log_in_path, :flash => { :success => "Signed Up Successfully. You can login now !" }
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id]) 
    rescue ActiveRecord::RecordNotFound
  
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
            flash[:success] = "Profile updated"
      #:flash => { :success => "Profile Updated! Feeling Refreshed already." }
      render "edit"
    else
      render "edit"
    end

  end


  def user_params
    params.require(:user).permit(:first_name,:last_name,:email, :password, :profile_name)
  end
  # def new_credits_params
  #   params.require(:credit).permit(:u_id => :email,:ans_id => "new_user_bonus",:uid_from => "new_user_bonus", :u_value => "50")
  
  # end

 
end
