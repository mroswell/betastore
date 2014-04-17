class UserMailer < ActionMailer::Base
  default from: "support@arcane-depths-1052.herokuapp.com"


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  # def welcome
  #   # @greeting = "Hi"

  #   # mail to: "to@example.org"

  # @name = user.email.split('@').first


  # mail to: user.email
  # end

  def welcome
    UserMailer.welcome(User.last)
  end

  #   def welcome(user)
  #   @name = user.email.split('@').first

  #   mail to: user.email
  # end
end
