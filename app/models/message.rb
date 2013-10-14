class Message < ActiveRecord::Base
  validates :title, :message, presence:true
end
