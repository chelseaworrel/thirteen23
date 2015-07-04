require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: "Taylor Swift",
                    username: "swifty",
                       email: "tswift4life@gmail.com",
                    password: "password",
                    location: "New York")
  end

  def test_user_is_valid
    assert @user.valid?
  end

  def test_a_user_missing_email_is_not_valid
    @user.email = nil
    refute @user.valid?
  end

  def test_a_user_missing_password_is_not_valid
    @user.password = nil
    refute @user.valid?
  end

  def test_a_user_missing_username_is_not_valid
    @user.username = nil
    refute @user.valid?
  end

  def test_a_user_missing_name_is_not_valid
    @user.name = nil
    refute @user.valid?
  end

  def test_a_user_missing_location_is_valid
    @user.location = nil
    assert @user.valid?
  end

  def test_invalid_without_a_properly_formatted_email
    @user.email = "solideffort"
    refute @user.valid?

    @user.email = "email@notasite"
    refute @user.valid?

    @user.email = "@bestfriends.com"
    refute @user.valid?

    @user.email = "cats@awesome.org"
    assert @user.valid?
  end
end
