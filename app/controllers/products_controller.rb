class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index ,:show]
  #before_action :move_to_index, except: [:index, :show, :new, :create]

  def index
    @product = Product.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
   end
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:image, :name, :explanation, :category_id, :situation_id, :delivery_charge_id, :prefecture_id, :number_of_day_id, :price).merge(user_id: current_user.id)
  end

  #def move_to_index
    #@product = Product.find(params[:id])
    #unless user_signed_in? && current_user.id == @prototype.user_id
      #redirect_to action: :index
    #end
  #end
end
