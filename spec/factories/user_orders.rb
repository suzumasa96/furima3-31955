FactoryBot.define do
  factory :user_order do
    token {"tok_avcdefghijk00000000000000000"}
    user_id {1}
    item_id {1}
    post_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    house_number { '1-1' }
    building_number { '東京ハイツ' }
    tell { '09012345678' }
  end
end