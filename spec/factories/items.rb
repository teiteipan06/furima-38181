FactoryBot.define do
  factory :item do
    name                  {"neko"}
    description           {"kawaii"}
    category_id           {2}
    status_id             {2}
    shipping_fee_id       {2}
    country_id            {2}
    days_to_ship_id       {2}
    price                 {1000}

    association :user
  end
end
