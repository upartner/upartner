class User < ActiveRecord::Base
  has_many :message,dependent: :destroy
  VALID_MAIL_REGEX = /\A[0-9A-Za-z_-]+@([0-9a-z-]+\.)+[0-9a-z-]+\z/
     VALID_REGEX = /\A[0-9A-Za-z_-]+\z/

     validates :user_id,   :presence => true, format:VALID_REGEX
     validates :name,  :presence => true
     validates :email, :presence => true, :confirmation => true, :format => VALID_MAIL_REGEX
     validates :password,  :presence => true, :confirmation => true, :format => VALID_REGEX
end
