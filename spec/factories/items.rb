FactoryBot.define do
  factory :item do
    item_name {"Rspecテスト商品"}
    guid {Faker::Lorem.sentence}
    status_id{2}
    costs_allocation_id {2}
    delivery_day_id {2}
    price {5000}
    category_id {2}
    prefecture_id {21}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end