FactoryBot.define do
  factory :purchaser_profile do
    postal_code       { '123-6789' }
    region_id         { 2 }
    municipality      { '横浜市緑区' }
    address           { '30-30' }
    building_name     { 'テストハウス' }
    telephone_number  { '08012341234' }
    token             { 'tok_abcdefghijk00000000000000000' }

  end
end
