class Notifier < ActionMailer::Base
  default :from => "srirajdutt@gmail.com"

  def password_reset_instructions(user)
    @user = user
    @temp_link = edit_password_reset_url(user.perishable_token)
    mail(:to => "#{user.login} <#{user.email}>", :subject => "Password Reset Instructions")
  end

end
