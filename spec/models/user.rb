require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is valid with valid attributes" do
    #expect(User.new).to be_valid
    expect(User.new(username: 'Anything', email: 'basda', password: "adsads", password_confirmation: "adsads")).to be_valid
  end
  it "is invalid without a username" do
    user = User.new(username: nil)
    expect(user).to_not be_valid
  end
  it "is invalid without a email" do
    user = User.new(email: nil)
    expect(user).to_not be_valid
  end
  it "is invalid without a password" do
    user = User.new(password: nil)
    expect(user).to_not be_valid
  end
end
