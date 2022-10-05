class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は文字と数字の両方を含めてください' 

  validates :name,             presence: true 
  validates :first_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字で入力してください' }
  validates :last_name_kanji,  presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字で入力してください' }
  validates :first_name_kana,  presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'はカタカナで入力してください' }
  validates :last_name_kana,   presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'はカタカナで入力してください' }
  validates :birthday,         presence: true
  
  has_many :products
  has_many :purchase_records
end
