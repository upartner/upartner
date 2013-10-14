require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  fixtures :messages
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
  
  
  test "title max check" do
    message = Message.new(title:      messages(:title_max_check1).title,
                          message:    "message",
                          image_url:  "ruby.gif")
    assert message.invalid?
    
    message2 = Message.new(title:      messages(:title_max_check2).title,
                           message:    "message",
                           image_url:  "ruby.gif")
    assert message2.valid?
    
    message3 = Message.new(title:      messages(:title_max_check3).title,
                           message:    "message",
                           image_url:  "ruby.gif")
    assert message3.valid?

    message4 = Message.new(title:      messages(:title_max_check4).title,
                           message:    "message",
                           image_url:  "ruby.gif")
    assert message4.invalid?
  end
  
    
end
