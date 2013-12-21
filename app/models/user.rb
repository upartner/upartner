class User < ActiveRecord::Base
  has_many :message,dependent: :destroy
  has_many :friend, foreign_key: "user_id", dependent: :destroy
  has_many :friend_users, foreign_key: "friend_id", dependent: :destroy
  VALID_MAIL_REGEX = /\A[0-9A-Za-z_\-.]+@([0-9a-z-]+\.)+[0-9a-z-]+\z/
     VALID_REGEX = /\A[0-9A-Za-z_-]+\z/

     validates :user_id,   :presence => true, format:VALID_REGEX, :uniqueness => true
     validates :name,  :presence => true
     validates :email, :presence => true, :confirmation => true, :format => VALID_MAIL_REGEX, :uniqueness => true
     validates :password,  :presence => true, :confirmation => true, :format => VALID_REGEX
end
