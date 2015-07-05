require 'rails_helper'

describe "user", type: :feature do

  before :each do
    @user = User.create(name:"Taylor Swift",
                    username:"tswift",
                       email: "tswifty@gmail.com",
                    password:"password")
    visit root_path
  end

  it "can login" do
    find(".login").click
    expect(current_path).to eq(login_path)
    page.fill_in "username", with: "tswift"
    page.fill_in "password", with: "password"
    click_button "Login"

    assert page.has_content?("Taylor")
  end

  it "can't login without a username" do
    find(".login").click
    expect(current_path).to eq(login_path)
    page.fill_in "password", with: "password"
    click_button "Login"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Invalid login")
  end

  it "can't login without a password" do
    find(".login").click
    expect(current_path).to eq(login_path)
    page.fill_in "username", with: "tswift"
    click_button "Login"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Invalid login")
  end
end
