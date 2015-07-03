require 'test_helper'

class UserCanSignUpTest < ActionDispatch::IntegrationTest
  def test_a_user_can_login
  swifty = User.create(username: "tswift",
                       password: "password",
                       name: "Taylor Swift",
                       location: "New York")

  visit root_path
  click_link("Login")
  fill_in "Username", with: "tswift"
  fill_in "Password", with: "password"
  click_button "Login"

  expect(current_path).to eq(user_path(swifty))
  assert page.has_content?("Welcome tswift")
  reset_session!
  end
end
