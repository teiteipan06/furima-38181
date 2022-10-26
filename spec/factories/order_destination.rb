FactoryBot.define do
  factory :order_destination do
    post_code { '123-4567' }
    country_id { "2" }
    city { "1" }
    banchi { '1-1' }
    building_name { '東京団地'}
    phone_number { '00000000000' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end