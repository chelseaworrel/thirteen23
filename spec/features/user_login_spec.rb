require 'rails_helper'

describe "user", type: :feature do

  before :each do
    @user = User.create(name:"Taylor Swift",
                    username:"tswift",
                       email: "tswifty@gmail.com",
                    password:"password")
    visit root_path
  end

  xit "can login" do
    save_and_open_page
    click_link("login")
    expect(current_path).to eq(login_path)
    page.fill_in "email", with: "tswifty@gmail.com"
    page.fill_in "password", with: "password"
    click_button "login"

    assert page.has_content?("Taylor")
  end

  xit "can't login without a username" do
    click_link("login")
    expect(current_path).to eq(login_path)
    page.fill_in "password", with: "password"
    click_button "login"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Invalid login")
  end

  xit "can't login without a password" do
    click_link("login")
    expect(current_path).to eq(login_path)
    page.fill_in "email", with: "tswifty@gmail.com"
    click_button "login"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Invalid login")
  end

  xit "can logout while logged in" do
    click_link("login")
    expect(current_path).to eq(login_path)
    page.fill_in "email", with: "twsifty@gmail.com"
    page.fill_in "password", with: "password"
    click_button "login"

    click_link("logout")
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Visit and old friend...")
  end
end
