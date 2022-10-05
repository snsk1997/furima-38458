class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase_record

  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :number_of_day
  
  validates :image,              presence: true
  validates :name,               presence: true
  validates :explanation,        presence: true
  validates :category_id,        numericality: { other_than: 1 , message: "を選んでください"}
  validates :situation_id,       numericality: { other_than: 1 , message: "を選んでください"}
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "を選んでください"}
  validates :prefecture_id,      numericality: { other_than: 1 , message: "を選んでください"}
  validates :number_of_day_id,   numericality: { other_than: 1 , message: "を選んでください"}
  validates :price,              presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "は金額の設定範囲外です"}
  validates :price,              numericality: {only_integer: true, message: "は半角数字を入力してください"}
                                 
  has_one_attached :image
end
