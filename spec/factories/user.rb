FactoryBot.define do
  factory :user do
    nickname                 {Faker::Name.initials(number: 2)}
    email                    {Faker::Internet.free_email}
    password                 {Faker::Internet.password(min_length: 6)}
    password_confirmation    {password}
    family_name              { '山田'}
    given_name               { '二郎'} 
    family_name_kana         { 'ヤマダ' }
    given_name_kana          { 'ジロウ'}
    birthday                 { Faker::Date.backward}
  end
end
