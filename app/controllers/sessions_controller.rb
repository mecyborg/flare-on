class SessionsController < ApplicationController
  skip_before_filter :require_login
  def new
   # userf = User.new
  end

  def index
      redirect_to log_in_path
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      if user.first_name == nil
      redirect_to edit_user_path(current_user), :flash => { :success => "Logged in ! Mark your name first." }

      else
      redirect_to myprofile_path, :flash => { :success => "Logged in ! Welcome aboard, mate." }
      end
    else
      flash.now[:alert] = 'Oops ! Invalid email or password.'
      render "new"
    end

  #  auth_hash = request.env['omniauth.auth']
 
  # @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
  # if @authorization
  #   render :text => "Welcome back #{@authorization.user.name}! You have already signed up."
  # else
  #   userf = User.new :name => auth_hash["user"]["name"], :email => auth_hash["user"]["email"]
  #   userf.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
  #   userf.save
 
  #   render :text => "Hi #{user.name}! You've signed up."
  # end 
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to log_in_url,  :flash => { :success => "Logged out ! Take Care Now. Bye bye then.." }
  end

  def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
