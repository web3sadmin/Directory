class UserMailer < ApplicationMailer
  default :from => "help@parallel.ua"

  def welcome_email(user)
    @user = user
    @url  = "http://example.com/login"
    mail(:to => "support@parallel.ua", :subject => "Создан новый пользователь")
  end
end
