class AlltopicsController < ApplicationController
  def new
    @alltopic = Alltopic.new
  end
  def create
    @alltopic = Alltopic.new(alltopic_params)
    if @alltopic.save
      render "show", :notice => "Topic Added!"
    #	render'index'
    else
      render "new"
    end
  end

  def alltopic_params
    params.require(:alltopic).permit(:t_id,:t_name)
  end

  def topic_ques
    @topic_ques ||= PostQuest.where(t_id: params[:t_id])
  end
  
    def user_follow
      @user_follow ||= TopicFollow.exists?(t_id: params[:t_id])
    end
end
