class MyactivityController < ApplicationController
  helper_method :answered
  helper_method :myupvotes

  def new
  end

  def show
  end

  def answered
    Answer.where('user_id = ?', current_user[:id].to_s).order('answers.created_at ASC').reverse_order
  end

  def myupvotes
    Credit.where('uid_from = ?', current_user[:id].to_s).order('credits.created_at ASC').reverse_order
  end
end
