class UserMailer < ActionMailer::Base
  default from: 'noreply@ideabata.com'

  def registration_confirmation(user)
    @user = user
    mail(to: "#{user.profile_name} <#{user.email}>", subject: 'Ideabata Alpha Registration Confirmation')
  end

  def password_reset(user)
    @user = user
    mail(to: "#{user.email}", subject: 'Password reset')
  end
end
