
# This will guess the User class
FactoryGirl.define do
  factory :alert do
    user
    alert_type
    description "This is an alert test"
    latitude -1968.5
    longitude 1689.65
  end

  factory :user do
    email "angelbuzany@gmail.com"
    name "Angel Buzany"
    nickname "abuzany"
    password "anitalavalatina2016*"
  end

  factory :alert_type do
    description "This is an alert type test"
  end
end
