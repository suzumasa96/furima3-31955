FactoryBot.define do
  factory :user_donation do
    post_code { '123-4567' }
    prefecture { 1 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    tell { '09012345678' }
    price { 2000 }
  end
end