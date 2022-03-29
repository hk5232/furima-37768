FactoryBot.define do
  factory :item do
    name                  { '見本' }
    explanation           { '見本です' }
    price                 { 1000 }
    category_id           {2}
    status_id             {2}
    cost_id               {2}
    source_id             {2}
    shipment_id           {2}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
