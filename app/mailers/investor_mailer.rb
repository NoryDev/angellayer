class InvestorMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.investor_mailer.welcome.subject
  #
  default from: 'angellayer@yopmail.com'

  def welcome(investor)
    @investor = investor  # Instance variable => available in view

    mail(to: @investor.email, subject: 'Your profile has been created on AngelLayer.com')
  end

end
