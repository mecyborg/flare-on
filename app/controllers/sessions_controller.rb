class SessionsController < ApplicationController
  skip_before_filter :require_login
  def new
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to profile_url, :flash => { :success => "Logged in ! Welcome aboard, mate." }
    else
      flash.now[:alert] = 'Oops ! Invalid email or password.'
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to log_in_url,  :flash => { :success => "Logged out ! Take Care Now. Bye bye then.." }
  end

  
end
