FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "password"
    password_confirmation "password"
  end

  factory :bookmark do
    sequence(:name) { |n| "Bookmark #{n}" }
    url "http://www.example.com"
    description "Lorem ipsum"
    user
  end
end