class UserMailer < ActionMailer::Base
  default from: 'singlefile188@gmail.com'
 
  def line_start_email(user)
    @user = user
    mail(to: @user.email, subject: 'Line starts!')
  end
end