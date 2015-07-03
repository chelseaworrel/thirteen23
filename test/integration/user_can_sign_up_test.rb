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

    assert_equal username_path, current_path
  end

  def test_it_throws_an_error_when_a_user_is_missing_name
    visit root_path
    click_link_or_button 'Create Account'
    fill_in "Username", with: "cdub"
    fill_in "Password", with: "password"
    fill_in "Name", with: ""
    click_button 'Create Account'

    assert page.has_content?("Name can't be blank")
  end

  def test_it_throws_an_error_when_a_user_is_username
    visit root_path
    click_link_or_button 'Create Account'
    fill_in "Username", with: ""
    fill_in "Password", with: "password"
    fill_in "Name", with: "Chelsea Worrel"
    click_button 'Create Account'

    assert page.has_content?("Username can't be blank")
  end

  def test_it_throws_an_error_when_a_user_is_username
    visit root_path
    click_link_or_button 'Create Account'
    fill_in "Username", with: "cdub"
    fill_in "Password", with: ""
    fill_in "Name", with: "Chelsea Worrel"
    click_button 'Create Account'

    assert page.has_content?("Password can't be blank")
  end

  def test_that_location_is_not_a_required_field
    visit root_path
    click_link_or_button 'Create Account'
    fill_in "Username", with: "cdub"
    fill_in "Password", with: "password"
    fill_in "Name", with: "Chelsea Worrel"
    fill_in "Location", with: ""
    click_button 'Create Account'

    assert_equal username_path, current_path
  end
end
