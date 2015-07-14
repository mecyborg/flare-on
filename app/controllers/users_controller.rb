class UsersController < ApplicationController
  # before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  helper_method :correct_url
  # acts_as_voter
  helper_method :userdetails
  # has_many :authorizations
  # validates :name, :email, :presence => true
  # def userdetails
  # #@userdetails = User.all
  # @users = User.paginate(page: params[:page], :per_page => 10)

  # end

  def following
    @title = 'Following'
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = 'Followers'
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def index           # all users index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def userprofile       # to show individual profile page
    @userprofile ||= User.find(params[:id])
  end

  def correct_url
    redirect_to(profile_url) unless @user == current_user
  end

  def correct_user        # to ensure current user does the edit (url manilpulation)
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to(profile_url) unless @user == current_user
  end

  # def index
  #   redirect_to sign_up_path
  # end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # @add_credit.save
      UserMailer.registration_confirmation(@user).deliver
      # flash[:success] = "Please confirm your email address to continue"
      # redirect_to log_in_path, :flash => { :success => "Signed Up Successfully. You can login now !" }
      redirect_to log_in_path, flash: { success: 'Please check your inbox for confirmation.' }

    else

      render 'users/new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    # rescue ActiveRecord::RecordNotFound
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile updated! Feeling Refreshed already.'

      render 'edit'
    else
      render 'edit'
    end
  end

  def delete_avatar
    # tempuser = current_user.user
    @user = User.find(params[:id])
    @user.avatar = nil
    @user.save
    redirect_to edit_user_path, flash: { success: 'Your Avatar has been removed.' }
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Welcome! Your email has been confirmed.
      Please Login in to continue."
      redirect_to log_in_url
    else
      flash[:error] = 'Sorry. User does not exist'
      redirect_to sign_up_url
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :profile_name, :bio, :avatar)
  end
end
