class UserMailer < ApplicationMailer
default from: "bebefit@goodmonit.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(email)
  	    puts "----------------------------------------__>>>>>>>>>>>>>>>>>>>>>>>>>>>>   mailer!!!!"
   @email= email

    mail to: @email, subject: "Share with your friend about Bebefit, and Get Bebefit Coupon for Each friend who signs up!"
    puts "----------------------------------------__>>>>>>>>>>>>>>>>>>>>>>>>>>>>   mailer!!!!"
  end
end
