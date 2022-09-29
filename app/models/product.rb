class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge
  
  validates :image,              presence: true
  validates :name,               presence: true
  validates :explanation,        presence: true
  validates :category_id,        numericality: { other_than: 1 , message: "can't be blank"}
  validates :situation_id,       numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,      numericality: { other_than: 1 , message: "can't be blank"}
  validates :number_of_day_id,   numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,              presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  validates :price,              numericality: {only_integer: true, message: "is invalid. Input half-width characters"}
                                 
  has_one_attached :image
end
