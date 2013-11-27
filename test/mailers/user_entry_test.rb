require 'test_helper'

class UserEntryTest < ActionMailer::TestCase
  test "semiRegistered" do
    mail = UserEntry.semiRegistered
    assert_equal "Semiregistered", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "Registered" do
    mail = UserEntry.Registered
    assert_equal "Registered", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
