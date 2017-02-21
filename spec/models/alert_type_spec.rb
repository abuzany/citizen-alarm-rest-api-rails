require 'rails_helper'

RSpec.describe AlertType, type: :model do
  it "is valid with valid attributes" do
    alert_type = build(:alert_type)

    expect(alert_type).to be_valid
  end
end
