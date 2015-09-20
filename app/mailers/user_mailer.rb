class UserMailer < ApplicationMailer
  def share(user, mail_to)
    @user = user
    mail to: mail_to
  end
end
