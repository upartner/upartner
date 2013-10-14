require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "message attributes must not be empty" do
    message = Message.new
    assert message.invalid?
    assert message.errors[:title].any?
    assert message.errors[:message].any?
  end
    
  def new_message(image_url)
    Message.new(title:      "tile",
                message:    "message",
                image_url:  image_url)
  end
  
  test "image url" do
  
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg fred.jpeg fred.JPEG http://a.b.c/x/y/z/fred.gif}
    bad = %w{ fred.dog fred.gif/more fred.gif.more}
    
    ok.each do |name|
      assert new_message(name).valid?, "#{name} shouldn't be invalid"
    end
    
    bad.each do |name|
      assert new_message(name).invalid?, "#{name} shouldn't be valid"
    end  
  end  
    
end
