module CreditsHelper
  def credits_info
    Credit.where(u_id: current_user[:id]).where.not(uid_from: 'new_user_bonus')
  end

  def credits_show
    Credit.where(u_id: current_user[:id]).sum(:u_value) + 50
  end
end
