#encoding: utf-8
require 'test_helper'

class UserEntryTest < ActionMailer::TestCase
  test "semiRegistered" do
    user = User.find(1)
    mail = UserEntry.semiRegistered(user)
    assert_equal "upartner会員仮登録完了", mail.subject
    assert_equal ["user01@test.jp"], mail.to
    assert_equal ["upartner0000@gmail.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "Registered" do
    user = User.find(1)
    mail = UserEntry.Registered(user)
    assert_equal "upartner会員登録完了", mail.subject
    assert_equal ["user01@test.jp"], mail.to
    assert_equal ["upartner0000@gmail.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
