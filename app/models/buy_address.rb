class BuyAddress 
  include ActiveModel::Model
  attr_accessor :postal_code, :source_id, :address_city, :address_street, :address_building, :phone_number, :item_id, :user_id, :buy_id

  validates :postal_code, presence: { message: 'は必須項目です' }
  validates :address_city, presence:  { message: 'は必須項目です' }
  validates :address_street, presence:  { message: 'は必須項目です' }
  validates :phone_number, presence:  { message: 'は必須項目です' }
  validates :item_id, presence: true
  validates :user_id, presence: true
  validates :source_id, numericality: { other_than: 1, message: 'は必須項目です。' }

  def save
    return false if invalid?
    buy = Buy.create(item_id: item_id, user_id: user_id)
    Address.create(buy_id: buy.id, postal_code: postal_code, address_city: address_city, address_street: address_street, address_building: address_building, phone_number: phone_number, source_id: source_id )
  end
end