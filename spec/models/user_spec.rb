require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: "Taylor Swift",
                      username: "swifty",
                         email: "tswift4life@gmail.com",
                      password: "password",
                      location: "New York") }

  it "is valid" do
    expect(user).to be_valid
  end

  it "is invalid without an email" do
    user.email = nil
    expect(user).not_to be_valid
  end

  it "is invalid without a password" do
    user.password = nil
    expect(user).not_to be_valid
  end

  it "is invalid without a properly formatted email address" do
    user.email = "solideffort"
    expect(user).not_to be_valid

    user.email = "email@notasite"
    expect(user).not_to be_valid

    user.email = "@bestfriends.com"
    expect(user).not_to be_valid

    user.email = "cats@awesome.org"
    expect(user).to be_valid
  end
end
