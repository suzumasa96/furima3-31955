FactoryBot.define do
  factory :user do
    name  { 'taro' }
    email { "1a" + Faker::Internet.free_email }
    password { "1a" + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { '田中' }
    last_name_kana { 'タナカ' }
    first_name { '太郎' }
    first_name_kana { 'タロウ' }
    birthday { '2000-01-01' }
  end
end