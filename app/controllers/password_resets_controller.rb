class PasswordResetsController < ApplicationController
  before_action :get_user,   only: [:edit, :update]
  #before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]
  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      render 'new'
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def update
    if params[:user][:password].empty?
      flash.now[:danger] = "Password can't be empty"
      render 'edit'
    elsif @user.update_attributes(user_params)
      
      flash[:success] = "Password has been reset."
      redirect_to log_in_path
    else
      render 'edit'
    end
  end

  def edit
  end

    private

    def get_user
      @user = User.find_by(email: params[:email])
    end

    # Confirms a valid user.
    # def valid_user
    #   unless (@user && @user.activated? &&
    #           @user.authenticated?(:reset, params[:id]))
    #     redirect_to root_url
    #   end
    # end
    def user_params
      params.require(:user).permit(:password)
    end

    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end
end
