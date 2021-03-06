#encoding: utf-8
class PortalController < ApplicationController
  before_action :user_params, only: [:login]

  
  def index
    @user = User.new()
  end



  ##ログイン処理 
  def login
    ##ユーザ確認
    user = User.find_by_email(params[:user][:email])
    logger.debug(user.inspect)
    ##パスワード確認
    if user and user.password == params[:user][:password] and user.activation
      ## セッションの取得（ユーザ）
      session[:id] = user.id
      redirect_to messages_url
    else
      redirect_to portal_index_path, notice: 'ユーザー名またはパスワードが間違っています'
    end    
  end

  ##ログアウト処理
  def logout
    session[:id] = nil
    redirect_to portal_index_path
    
  end
  
  private
      # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
