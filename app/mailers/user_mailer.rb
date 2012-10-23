class UserMailer < ActionMailer::Base
  default from: "something@something.com"

  def welcome_mail(email)
    mail(:to => email, :subject => "Welcome to Grocery List!").deliver
  end
end
