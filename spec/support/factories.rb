FactoryGirl.define do

  factory :user do
    username { Faker::Name.name }
    password 'password'
    password_confirmation 'password'
    email_address { Faker::Internet.email }
  end

  factory :url do
    title { Faker::Hipster.word }
    url 'https://twitter.com/'
    user
  end
end
