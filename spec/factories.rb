FactoryGirl.define do
  factory :user do
    name     "Ruby User"
    email    "ruby@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end