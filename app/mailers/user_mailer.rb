class UserMailer < ApplicationMailer

default from: 'akshaysareen97@gmail.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://myproject.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
  
end
