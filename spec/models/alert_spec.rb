require 'rails_helper'

RSpec.describe Alert, type: :model do
  it "is valid with valid attributes" do
    alert = build(:alert)

    expect(alert).to be_valid
  end

  it "is not valid without a user" do
    alert = build(:alert)
    alert.user = nil
    expect(alert).to_not be_valid
  end

  it "is not valid without a alert_type" do
    alert = build(:alert)
    alert.alert_type = nil
    expect(alert).to_not be_valid
  end

  it "is not valid without a description" do
    alert = build(:alert)
    alert.description = nil
    expect(alert).to_not be_valid
  end

  it "is not valid without a latitude" do
    alert = build(:alert)
    alert.latitude = nil
    expect(alert).to_not be_valid
  end

  it "is not valid without a longitude" do
    alert = build(:alert)
    alert.longitude = nil
    expect(alert).to_not be_valid
  end

  it "is not vaid with blank description" do
    alert = build(:alert)
    alert.description = ""
    expect(alert).to_not be_valid
  end

  it "is not vaid with a description of more than 140 chars" do
    alert = build(:alert)
    alert.description = "Satrapi was born in Rasht, Iran, and grew up in Tehran
    in a middle-class Iranian family.Both her parents were politically
    active and supported Marxist causes against the monarchy of the last Shah.
    When the Iranian Revolution took place in 1979, they were dismayed and
    intimidated by the Muslim fundamentalists who took power."
    expect(alert).to_not be_valid
  end

  it "is vaid with a description of less than 140 chars" do
    alert = build(:alert)
    alert.description = "This is an alert test."
    expect(alert).to be_valid
  end

  it "retrieves a correct addres when is created" do
    alert = create(:alert)

    # Expect retrieves "Independece Monument" address =)
    expect(alert.address).to eql(
      "Calle Río Tiber 204, Cuauhtémoc, 06500 Ciudad de México, CDMX, Mexico"
    )
  end

end
