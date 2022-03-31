class BuyAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :source_id, :address_city, :address_street, :address_building, :phone_number, :item_id,
                :user_id, :buy_id

  validates :postal_code, presence: { message: 'は必須項目です' },
                          format: { with: /\A\d{3}-\d{4}\z/, allow_blank: true, message: 'は000-0000の形でのみ登録可能です' }
  validates :address_city, presence:  { message: 'は必須項目です' }
  validates :address_street, presence:  { message: 'は必須項目です' }
  validates :phone_number, presence: { message: 'は必須項目です' },
                           format: { with: /\A\d{10}$|^\d{11}\z/, allow_blank: true, message: 'は10から11桁の半角数字でのみ登録可能です' }
  validates :item_id, presence: true
  validates :user_id, presence: true
  validates :source_id, numericality: { other_than: 1, message: 'は必須項目です' }
  validates :token, presence: { message: 'カードは全て必須項目です' }

  def save
    return false if invalid?

    buy = Buy.create(item_id: item_id, user_id: user_id)
    Address.create(buy_id: buy.id, postal_code: postal_code, address_city: address_city, address_street: address_street,
                   address_building: address_building, phone_number: phone_number, source_id: source_id)
  end
end
