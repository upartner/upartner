#encoding: utf-8
class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :set_mydata, only: [:show]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    
      @user = User.find(session[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.activation = false

    respond_to do |format|
      if @user.save
#        session[:login] = @user
#       session[:user_id] = @user.id
        secret = SecureRandom::hex(50)
        session[:secret] = secret
        UserEntry.semiRegistered(@user, secret).deliver
        format.html { redirect_to users_entry_mail_send_path, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
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
  
  def auth
    # secret = SecureRandom::hex(50)
    encryptor = ::ActiveSupport::MessageEncryptor.new(session[:secret], cipher: 'aes-256-cbc')
    url = request.url.to_s
    url_sp = url.split("?")
    query = encryptor.decrypt_and_verify(url_sp[1])
    user_id = query[/=(\w+)/, 0].delete("=")

    @user = User.find(user_id)
    
    if @user
      @user.update(activation: true)
      session[:id] = @user.id
      UserEntry.Registered(@user).deliver

   else
      respond_to do |format|
      format.html { redirect_to portal_index_path, notice: @url}
      format.json { head :no_content }
      end
   end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    
    def set_mydata
      @user = User.find(session[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password, :email, :email_confirmation, :password_confirmation)
    end
end
