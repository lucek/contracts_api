FactoryBot.define do
  factory :contract do
    vendor    { Faker::Lorem.word }
    starts_on { Date.today }
    ends_on   { Faker::Date.forward(365) }
    price     { Faker::Number.number(100) }
    user      { create :user }
  end

  factory :user do
    full_name { Faker::Zelda.character }
    email     { "#{full_name}@hyrule.com" }
    password  'v0lders'
  end
end
