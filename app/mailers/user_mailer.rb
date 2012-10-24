class UserMailer < ActionMailer::Base
  default from: "siri@grocerylist.com"

  def welcome_email(user)
    @user = user
    @url = 'http://groc.dev'
    mail(:to => user.email, :subject => "Welcome to Grocery List!").deliver
  end
end
