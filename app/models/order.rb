class Order

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id, :product_id, :token

  with_options presence: true do
    validates :token         
    validates :post_code,    format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality 
    validates :address       
    validates :phone_number, numericality: {only_integer: true, message: "is invalid. Input half-width characters"}
    validates :user_id       
    validates :product_id     
  end

  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  validates :phone_number,  length: { minimum: 10 ,  message: "is too short"} 
  validates :phone_number,  length: { maximum: 11 , message: "is too long"} 
  
  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, product_id: product_id)
    ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id )
  end
end
