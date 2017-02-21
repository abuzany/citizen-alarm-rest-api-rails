require 'rails_helper'

describe Api::V2::AlertsController do
  it "create an alert" do
    alert = build(:alert)

    post :create, alert

    expect(response).to be_success
  end

  it "retrieves a list of alerts" do
    alert = build(:alert)

    # First of all creat an alert
    post :create, alert

    expect(response).to be_success

    get :index

    # test for the 200 status-code
    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json).to_not be_nil

    expect(json).to_not be_empty
  end
end
