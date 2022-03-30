FactoryBot.define do
  factory :buy_address do
    postal_code                  { '111-1111' }
    address_city                 { '新宿区新宿' }
    address_street               { '東新宿１−２−３' }
    address_building             { '東ビル３F' }
    source_id                    { 2 }
    phone_number                 { '00011112222' }

  end
end