class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #
  def reset_password_email(user)
    @user = user
    @url = "http://0.0.0.0:3000/password_resets/#{user.reset_password_token}/edit"

    mail(to: user.email, subject: "Your password has been reset")
  end

  def activation_needed_email(user)
    @user = user
    @url = "http://0.0.0.0:3000/users/#{user.activation_token}/activate"

    mail(to: user.email, subject: "Welcome to FriendKarma!")
  end

  def activation_success_email(user)
    @user = user
    @url = "http://0.0.0.0:3000/users/login"
    mail(to: user.email, subject: " FriendKarma - your account is now activated")
  end
end
