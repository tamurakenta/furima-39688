FactoryBot.define do
  factory :user do
    nickname              {'testname'}
    email                 {Faker::Internet.email}
    password              {"1a" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             { 'やマ田' }
    first_name            { '太ろウ' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday              {Faker::Date.backward}
  end
end
