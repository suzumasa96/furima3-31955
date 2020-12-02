FactoryBot.define do
  factory :item do
    item_name         {Faker::Lorem.sentence}
    user_id           {1}
    introduction      {Faker::Lorem.sentence}
    category_id       {2}
    condition_id      {3}
    shipping_cost_id  {2}
    destination_id    {3}
    shipping_date_id  {3}
    price             {300}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
    end
  end
end
