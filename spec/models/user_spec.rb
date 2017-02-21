require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = build(:user)

    expect(user).to be_valid
  end

  it "is not valid with nil password" do
    user = build(:user)
    user.password = nil
    expect(user).to_not be_valid
  end

  it "is not valid with empty password" do
    user = build(:user)
    user.password = ""
    expect(user).to_not be_valid
  end

  it "is not valid with blank password" do
    user = build(:user)
    user.password = " "
    expect(user).to_not be_valid
  end

  it "is not valid with nil email" do
    user = build(:user)
    user.email = nil
    expect(user).to_not be_valid
  end

  it "is not valid with empty email" do
    user = build(:user)
    user.email = ""
    expect(user).to_not be_valid
  end

  it "is not valid with blank email" do
    user = build(:user)
    user.email = " "
    expect(user).to_not be_valid
  end

end
