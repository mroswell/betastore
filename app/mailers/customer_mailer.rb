class CustomerMailer < ActionMailer::Base
  default from: "support@betastore.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.customer_mailer.welcome.subject
  #
  def welcome(customer)
    @customer = customer

    @token = Rails.application.message_verifier('customer').generate(@customer.id)

    mail to: @customer.email
  end
end
