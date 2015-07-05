require 'rails_helper'

describe "user creates account", type: :feature do
  it "user can create account" do
    visit root_path
    click_link("Create Account")
    page.fill_in "email", with: "cdub@gmail.com"
    page.fill_in "password", with: "password"
    page.fill_in "name", with: "Chelsea Worrel"
    page.fill_in "location (optional)", with: "Denver"
    page.fill_in "username", with: "cdub"
    click_button("Create Account")

    expect(page).to have_content("Chelsea")
  end

  it "user can't create account without all required fields" do
    visit root_path
    click_link("Create Account")
    page.fill_in "password", with: "password"
    page.fill_in "name", with: "Chelsea Worrel"
    click_button("Create Account")

    expect(current_path).to eq(new_user_path)
    expect(page).to_not have_content("Chelsea")
  end
end
