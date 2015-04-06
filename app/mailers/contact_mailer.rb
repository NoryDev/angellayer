class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact.subject
  #
  def contact(message)
    @message = message

    mail(to: "info@sharkrank.co", from: "#{@message[:name]} <#{@message[:email]}>", subject: @message[:subject])
  end

  def flag(content)
    @content = content

    mail(to: "info@sharkrank.co", from: "#{@content[:name]} <#{@content[:email]}>", subject: "Flag: Eval n°#{@content[:eval_id]}")
  end
end
