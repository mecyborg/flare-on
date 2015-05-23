class MyactivityController < ApplicationController
  helper_method :answered
  helper_method :myupvotes
  before_filter :require_login

  def new
  end

  def show
  end

  def answered
  answered = Answer.where("user_id = ?", current_user[:profile_name]).order('answers.created_at ASC').reverse_order 
    
  end

  def myupvotes
  myupvotes = Credit.where("uid_from = ?", current_user[:profile_name]).order('credits.created_at ASC').reverse_order 
  end
end
