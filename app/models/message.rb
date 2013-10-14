#encoding: utf-8
class Message < ActiveRecord::Base
  validates :title, :message, presence:true
  validates :image_url, allow_blank: true, format: {
    with:%r{\.(gif|jpg|png|JPEG)\Z}i,
    message: 'はGIF、JPG、PNG画像のURLでなければなりません'
  }
  validates :title, length:{maximum: 30}
end
