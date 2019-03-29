class UserMailer < ApplicationMailer
default from: "bluemk56@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(email)
  	    puts "----------------------------------------__>>>>>>>>>>>>>>>>>>>>>>>>>>>>   mailer!!!!"
   @email= email

    mail to: @email, subject: "Sign up confirmation"
    puts "----------------------------------------__>>>>>>>>>>>>>>>>>>>>>>>>>>>>   mailer!!!!"
  end
end
