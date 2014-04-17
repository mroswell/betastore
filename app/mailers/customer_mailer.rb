class CustomerMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.customer_mailer.welcome.subject
  #
  def welcome(customer)
    @customer = customer
    @greeting = "Hi"

    token = Rails.application.message_verifier('customer').generate(@customer.id)

    mail to: @customer.email
  end
end
