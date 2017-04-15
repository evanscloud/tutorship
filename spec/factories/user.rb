# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    name          { Faker::Name.name }
    email         { Faker::Internet.email }
    location      { Faker::Address.country }
    login         { Faker::Internet.unique.user_name separators: ['-'] }
    github_id     { Faker::Number.unique.number(8) }
    avatar_url    { Faker::Avatar.image }
    github_url    { Faker::Internet.url }
    github_token  { Faker::Number.hexadecimal(40) }
    created_at    { Faker::Date.birthday(1, 10) }
    updated_at    { 1.hours.ago }
  end
end
