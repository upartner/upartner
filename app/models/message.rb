#encoding: utf-8
class Message < ActiveRecord::Base
  belongs_to :user
  #validation
  ##必須チェック
  validates :title, :message, presence:true
  ##最大文字数チェック
  validates :title, length:{maximum: 30}
  ##拡張子チェック
  validates :image_url, allow_blank: true, format: {
    with:%r{\.(gif|jpg|png|JPEG)\Z}i,
    message: 'は、GIF、JPG、JPEG、PNG画像のURLでなければなりません'
  }
end
