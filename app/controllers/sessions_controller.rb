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
      if user.email_confirmed
        if user.first_name.nil?
          redirect_to edit_user_path(current_user), flash: { success: 'Logged in ! Mark your name first.' }

        else
          redirect_to myprofile_path, flash: { success: 'Logged in ! Welcome aboard, mate.' }
        end

      else
        flash.now[:alert] = 'Please activate your account by following the
        instructions in the account confirmation email you received to proceed'
        render 'new'
      end

    else
      flash.now[:alert] = 'Oops ! Invalid email or password.'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to log_in_url,  flash: { success: 'Logged out ! Take Care Now. Bye bye then..' }
  end

  def failure
    render text: "Sorry, but you didn't allow access to our app!"
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
