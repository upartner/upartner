class PortalController < ApplicationController
  before_action :user_params, only: [:login]

  
  def index
    @user = User.new()
  end



  ##ログイン処理 
  def login
    ##ユーザ確認
    user = User.find_by_user_id(params[:user][:user_id])
    logger.debug(user.inspect)
    ##パスワード確認
    if user and user.password == params[:user][:password] and user.activation
      ## セッションの取得（ユーザ）
      session[:user_id] = user.id
      redirect_to messages_url
    else
      redirect_to portal_index_path
    end    
  end

  ##ログアウト処理
  def logout
    session[:user_id] = nil
    redirect_to portal_index_path
    
  end
  
  
      # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user_id, :password)
    end
end
