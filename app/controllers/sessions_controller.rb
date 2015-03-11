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

 end

 def social_login
  auth_hash = request.env['omniauth.auth']
 
  if session[:user_id]
    # Means our user is signed in. Add the authorization to the user
    User.find(session[:user_id]).add_provider(auth_hash)
 
    render :text => "You can now login using #{auth_hash["provider"].capitalize} too!"
  else
    # Log him in or sign him up
    auth = Authorization.find_or_create(auth_hash)
 
    # Create the session
    session[:user_id] = auth.user.id
 
  #  render :text => "Welcome #{auth.user.name}!"
  end

  end
  
  def destroy
    session[:user_id] = nil
    redirect_to log_in_url,  :flash => { :success => "Logged out ! Take Care Now. Bye bye then.." }
  end

  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end

  def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
