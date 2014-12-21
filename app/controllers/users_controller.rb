class UsersController < ApplicationController
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
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
  def user_params
    params.require(:user).permit(:first_name,:last_name,:email, :password, :profile_name)
  end
  # def new_credits_params
  #   params.require(:credit).permit(:u_id => :email,:ans_id => "new_user_bonus",:uid_from => "new_user_bonus", :u_value => "50")
  
  # end

 
end
