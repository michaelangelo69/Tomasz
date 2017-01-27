class ShopsController < ApplicationController
before_action :set_shop, only: [:show, :edit,:update]

def index
  @shops = Shop.all
end

def edit

end

def update
  if @shop.update_attributes(shop_params)
    redirect_to shops_path, notice: 'Shop was succesfully updated.'
  else
    render :edit
  end
end

def new
  @shop = Shop.new
end

def show
  @products = @shop.product
end

def create
  @shop = Shop.new(shop_params)
  if @shop.save
    redirect_to shops_path, notice: 'Shop was succesfully created.'
  else
    render :new
  end
end

private
  def shop_params
    params.require(:shop).permit(:name)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end
end
