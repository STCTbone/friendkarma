class InterestedMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.interested_mailer.signup.subject
  #
  def signup(email)
	@email = email
	mail(to: @email, subject: "Thanks for signing up for FriendKarma Information!") 
  end
end
