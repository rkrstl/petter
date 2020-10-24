FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    birth                 { "1997-07-14" }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
  end
end
