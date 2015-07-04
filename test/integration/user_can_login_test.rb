require 'test_helper'

class UserCanSignUpTest < ActionDispatch::IntegrationTest
  def test_a_user_can_login
  swifty = User.create(username: "tswift",
                       password: "password",
                       name: "Taylor Swift",
                       email: "tswift4life@gmail.com",
                       location: "New York")

  visit root_path
  click_link_or_button("Login")
  fill_in "username", with: "tswift"
  fill_in "password", with: "password"
  click_button "Login"
  assert_equal username_path(swifty), current_path
  assert page.has_content?("Taylor Swift")
  end
end
