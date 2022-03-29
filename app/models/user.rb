class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は英字と数字の両方を含めて下さい。' }
  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力して下さい。' }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヴー]+\z/, message: 'は全角カタカナで入力して下さい。' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力して下さい。' }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヴー]+\z/, message: 'は全角カタカナで入力して下さい。' }
  validates :birthday, presence: true
end
