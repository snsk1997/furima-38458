class Order

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id, :product_id, :token

  validates :token,         presence: true

  validates :post_code,     presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  validates :municipality,  presence: true
  validates :address,       presence: true
  validates :phone_number,  presence: true, numericality: {only_integer: true, message: "is invalid. Input half-width characters"}
  validates :phone_number,  length: { minimum: 10, maximum: 11 , message: "is too short"}
  validates :user_id,       presence: true
  validates :product_id,    presence: true 

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, product_id: product_id)
    ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id )
  end
end
