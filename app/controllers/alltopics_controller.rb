class AlltopicsController < ApplicationController
  def new
    @alltopic = Alltopic.new
  end
  def create
    @alltopic = Alltopic.new(alltopic_params)
    if @alltopic.save
      #render "show", :notice => "Topic Added!"
      redirect_to alltopic_path(@alltopic), :flash => { :success => "Topic Added" }

    #	render'index'
    else
      render "new",  :flash => { :danger => "Error" }
    end
  end


  def alltopic_params
    params.require(:alltopic).permit(:t_id,:t_name)
  end

  def index           #all topics index
    @alltopics = Alltopic.paginate(page: params[:page], :per_page => 4)
  end 

    
def show
    def anytopic      #individual topic page
    @anytopic ||= Alltopic.find(params[:id])
    end

    
end
  # def topic_ques
  #   @topic_ques ||= @anytopic.where(t_id: params[:id])
  # end
  
    def user_follow
      @user_follow ||= TopicFollow.exists?(t_id: params[:t_id])
    end
end
