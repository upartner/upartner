#encoding: utf-8
class FriendsController < ApplicationController
  before_action :set_followed_users, only: [:list , :destroy]

  # GET /friends
  # GET /friends.json
  def list
    
  end

  # POST /friends
  # POST /friends.json
  def create
    @friend = User.new(friend_params)

    respond_to do |format|
      if @friend.save
        session[:user_id] = @user.id
        format.html { redirect_to users, notice: 'Relationship was successfully created.' }
        format.json { render action: 'index', status: :created, location: @followed_users }
      else
        format.html { render action: 'index' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def entry_mail_send
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_followed_users
    @user = User.find(session[:user_id])
    @followed_users = @user.followed_users
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user_id, :friend_id)
    end
end
