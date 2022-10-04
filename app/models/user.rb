class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers' 

  validates :name,             presence: true 
  validates :first_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' }
  validates :last_name_kanji,  presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' }
  validates :first_name_kana,  presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters' }
  validates :last_name_kana,   presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters' }
  validates :birthday,         presence: true
  
  has_many :products
  has_many :purchase_records
end
