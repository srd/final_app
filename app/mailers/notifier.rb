class Notifier < ActionMailer::Base
  default :from => "srirajdutt@gmail.com"

  def password_reset_instructions(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Password Reset Instructions")
  end

end
