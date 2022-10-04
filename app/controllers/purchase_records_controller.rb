class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(purchase_record_params)
    if @order.valid?
      pay_product
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_record_params
    params.require(:order).permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, product_id: @product.id, token: params[:token])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: purchase_record_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if current_user.id == @product.user_id || @product.purchase_record.present?
      redirect_to root_path
    end
  end
end
