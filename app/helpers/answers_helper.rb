module AnswersHelper
	def allans_show
    @allans_show = Answer.where(question_id: params[:id]).order('notifications.created_at ASC')
    end

end