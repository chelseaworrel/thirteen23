require 'test_helper'
class UserCanSignUpTest < ActionDispatch::IntegrationTest
  def test_a_user_can_sign_up
    visit root_path
    assert page.has_content?("Welcome")
    assert page.has_link?("Create Account")
    assert page.has_link?("Sign In")

    click_link_or_button 'Create Account'
    fill_in "Name", with: "Chelsea Worrel"
    fill_in "Username", with: "cdub"
    fill_in "Password", with: "password"
    fill_in "Location", with: "Denver"
    click_link_or_button 'Create Account'

    assert_equal user_path, current_path
  end
end
