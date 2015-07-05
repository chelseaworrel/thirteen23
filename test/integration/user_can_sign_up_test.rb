require 'test_helper'

class UserCanSignUpTest < ActionDispatch::IntegrationTest
  def test_a_user_can_find_sign_up_link
    visit root_path
    assert page.has_link?("Create Account")
    assert page.has_link?("Login")
  end

  def test_a_user_can_sign_up
    user = User.create(username: "cdub",
                         password: "password",
                         name: "Chelsea Worrel",
                         email: "chelsea@gmail.com",
                         location: "Denver")
    visit new_user_path
    fill_in "name", with: "Chelsea Worrel"
    fill_in "username", with: "cdub"
    fill_in "password", with: "password"
    fill_in "location (optional)", with: "Denver"
    fill_in "email", with: "chelsea@gmail.com"

    within('.body-style') do
      click_link_or_button 'Create Account'
    end

    assert_equal username_path(user), current_path
    reset_session!
  end

  def test_it_throws_an_error_when_a_user_is_missing_name
    visit root_path
    click_link_or_button 'Create Account'
    fill_in "username", with: "cdub"
    fill_in "password", with: "password"
    fill_in "email", with: "chelsea@gmail.com"
    fill_in "name", with: ""
    click_button 'Create Account'

    assert page.has_content?("Name can't be blank")
    reset_session!
  end

  def test_it_throws_an_error_when_a_user_is_username
    visit root_path
    click_link_or_button 'Create Account'
    fill_in "username", with: ""
    fill_in "password", with: "password"
    fill_in "email", with: "chelsea@gmail.com"
    fill_in "name", with: "Chelsea Worrel"
    click_button 'Create Account'

    assert page.has_content?("Username can't be blank")
    reset_session!
  end

  def test_it_throws_an_error_when_a_user_is_username
    visit root_path
    click_link_or_button 'Create Account'
    fill_in "username", with: "cdub"
    fill_in "email", with: "chelsea@gmail.com"
    fill_in "password", with: ""
    fill_in "name", with: "Chelsea Worrel"
    click_button 'Create Account'

    assert page.has_content?("Password can't be blank")
    reset_session!
  end

  def test_that_location_is_not_a_required_field
    user = User.create(username: "cdub",
                         password: "password",
                         name: "Chelsea Worrel",
                         email: "chelsea@gmail.com",
                         location: "Denver")
    visit root_path
    click_link_or_button 'Create Account'
    fill_in "username", with: "cdub"
    fill_in "password", with: "password"
    fill_in "name", with: "Chelsea Worrel"
    fill_in "email", with: "chelsea@gmail.com"
    fill_in "location (optional)", with: ""
    click_button 'Create Account'

    assert_equal username_path(user), current_path
    reset_session!
  end
end
