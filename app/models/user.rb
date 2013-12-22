class User < ActiveRecord::Base
  #User_message_relationship
  has_many :message,dependent: :destroy
  
  #User_followed_users_relationship
  ##User.id - Friend.user_id - Friend.friend_id - User.id
  has_many :friends, foreign_key: "user_id", dependent: :destroy
  has_many :followed_users, through: :friends ,foreign_key: "friend_id", source: :friend
  
  #User_follower_relationship
  ##User.id - Friend.friend_id - Friend.user_id - User.id
  has_many :reverse_friends, foreign_key: "friend_id" ,class_name: "Friend" ,dependent: :destroy
  has_many :follower, through: :reverse_friends ,source: :user

  #User_validates
  VALID_MAIL_REGEX = /\A[0-9A-Za-z_\-.]+@([0-9a-z-]+\.)+[0-9a-z-]+\z/
     VALID_REGEX = /\A[0-9A-Za-z_-]+\z/

     validates :user_id,   :presence => true, format:VALID_REGEX, :uniqueness => true
     validates :name,  :presence => true
     validates :email, :presence => true, :confirmation => true, :format => VALID_MAIL_REGEX, :uniqueness => true
     validates :password,  :presence => true, :confirmation => true, :format => VALID_REGEX
end
