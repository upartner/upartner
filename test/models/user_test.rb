require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup   
    #fixtures :users
    #fixtures :friends
    #fixtures :messages
  end
  
  def test_find_by_user_id
    @users = User.find_by_user_id("user01")
    assert_equal "user01" ,@users.name
  end

  def test_user_hasmany_message
    @users = User.find_by_user_id("user01")
    @messages = @users.message
    assert_equal @messages.count , 3
  end

  def test_friend_users
    @users = User.find_by_user_id("user01")
    @friends = @users.followed_users
    assert_equal @friends.count , 4
    
    #assert_equal users(user01_follow_user02),@freinds
  end
    
  def test_user_hasmany_friend
    @users = User.find_by_user_id("user01")
    @friends = @users.follower
    assert_equal @friends.count , 1
  end    

  
end

  