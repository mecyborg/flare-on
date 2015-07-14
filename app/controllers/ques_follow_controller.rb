class QuesFollowController < ApplicationController
  def new
    # @ques_follows = QuesFollow.new
    # puts params.inspect
    if request.env['HTTP_REFERER'].blank?
      redirect_to post_quests_path
    else
      # if QuesFollow.exists?(email: current_user.email )
      @ques_follows = QuesFollow.new

      @ques_follows.q_id = params[:id]
      # @ques_follows.q_id = params[:post_quest_id]

      @ques_follows.email = current_user.email

      if @ques_follows.save

        redirect_to :back, flash: { success: 'Question Followed !' }
      else
        redirect_to root_url
      end

    end
  end

  def destroy
    follows_delete = QuesFollow.where('q_id = ?', 'email = ?', params[:id], current_user.email)
    follows_delete.destroy
  end
end
