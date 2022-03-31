class Address < ApplicationRecord
  belongs_to :buy

  validates :postal_code, presence: true
  validates :address_city, presence: true
  validates :address_street, presence: true
  validates :address_street, presence: true
  validates :phone_number, presence: true
  validates :source_id, numericality: { other_than: 1 }
end
