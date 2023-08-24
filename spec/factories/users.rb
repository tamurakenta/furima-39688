FactoryBot.define do
  factory :user do
    nickname              {'testname'}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {Faker::Name.last_name}
    first_name            {Faker::Name.first_name}
    last_name_kana        {Faker::Name.initials(number: 2)}
    first_name_kana       {Faker::Name.initials(number: 2)}
    birthday              {Faker::Date.backward}
  end
end
