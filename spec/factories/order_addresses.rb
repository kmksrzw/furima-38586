FactoryBot.define do
  factory :order_address do
     post_code {"123-4567"}
     prefecture_id {1}
     city {"町田市"}
     house_number {"住所１−１−１"}
     building_name {"サンハイツ岩田１０１"}
     tel {"09012345678"}
     token {"tok_99999999999999999999abc"}
  end
end
