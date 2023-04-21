FactoryBot.define do
  factory :item do
    product_name    { Faker::Name.name }
    introduction    { Faker::Lorem.sentence }
    category_id     { 2 }
    status_id       { 2 }
    charge_id       { 2 }
    region_id       { 2 }
    delivery_day_id { 2 }
    price           { 10_000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
