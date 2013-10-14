require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  fixtures :messages

  #項目未定義の場合、エラーとなることをチェック
  test "message attributes must not be empty" do
    message = Message.new
    assert message.invalid?
    assert message.errors[:title].any?
    assert message.errors[:message].any?
  end
  
  #image_urlテスト用messageクラス定義  
  def new_message(image_url)
    Message.new(title:      "tile",
                message:    "message",
                image_url:  image_url)
  end
  
  #image_url拡張子テスト
  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg fred.jpeg fred.JPEG http://a.b.c/x/y/z/fred.gif}
    bad = %w{ fred.dog fred.gif/more fred.gif.more}
    ##正常の場合
    ok.each do |name|
      assert new_message(name).valid?, "#{name} shouldn't be invalid"
    end
    #異常の場合
    bad.each do |name|
      assert new_message(name).invalid?, "#{name} shouldn't be valid"
    end  
  end  
  
  ##titleの最大文字数チェック
  test "title max check" do
    #半角30文字以上の場合エラーとなること
    message = Message.new(title:      messages(:title_max_check1).title,
                          message:    "message",
                          image_url:  "ruby.gif")
    assert message.invalid?
    #半角30文字の場合正常となること
    message2 = Message.new(title:      messages(:title_max_check2).title,
                           message:    "message",
                           image_url:  "ruby.gif")
    assert message2.valid?
    #全角30文字の場合正常となること
    message3 = Message.new(title:      messages(:title_max_check3).title,
                           message:    "message",
                           image_url:  "ruby.gif")
    assert message3.valid?
    #半角全角混在で30文字以上の場合、エラーとなること
    message4 = Message.new(title:      messages(:title_max_check4).title,
                           message:    "message",
                           image_url:  "ruby.gif")
    assert message4.invalid?
  end
  
    
end
