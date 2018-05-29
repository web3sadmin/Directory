class UserMailer < ApplicationMailer
  default :from => "dir@pluton.biz"

  def welcome_email(user)
    @user = user
    @url  = "http://example.com/login"
    mail(:to => "mikle.simonenko@pluton.ua", :subject => "Создан новый пользователь")
  end
end
