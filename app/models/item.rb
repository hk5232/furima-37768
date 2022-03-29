class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :source
  belongs_to_active_hash :category
  belongs_to_active_hash :cost
  belongs_to_active_hash :shipment
  belongs_to_active_hash :status
  has_one_attached :image
  belongs_to :user

  validates :image, presence: { message: "は必須項目です" }
  validates :name, presence: { message: "は必須項目です" }
  validates :explanation, presence: { message: "は必須項目です" }
  validates :category_id, :status_id, :cost_id, :source_id, :shipment_id, numericality: { other_than: 1 , message: "は必須項目です。"}
  validates :price, presence: { message: "は必須項目です" }, inclusion: { in: (300..9999999), allow_blank: true, message: "は300~9999999(半角)まで設定可能です。カンマは省略して記載してください。"}
end
