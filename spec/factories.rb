require 'factory_girl'


FactoryGirl.define do
  factory :user do 
    name    "Some Won"
    email   "somewon@example.com"
    password "foolishbar"
    password_confirmation  "foolishbar"
  end
end
