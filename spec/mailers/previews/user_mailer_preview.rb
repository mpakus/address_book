# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/share
  def share(user, mail_to)
    UserMailer.share(user, mail_to)
  end
end
