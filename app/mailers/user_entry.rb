#encoding: utf-8
class UserEntry < ActionMailer::Base
  default from: "upartner0000@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_entry.semiRegistered.subject
  #
  def semiRegistered(user)
    @user = user    
    @greeting = "Hi"
    
    mail to: @user.email, subject: 'upartner会員仮登録完了'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_entry.Registered.subject
  #
  def Registered(user)
    @user = user    
    @greeting = "Hi"
    
    mail to: @user.email, subject: 'upartner会員登録完了'
  end
end
