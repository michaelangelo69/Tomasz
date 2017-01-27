class ProductsController < ApplicationController
  before_action :set_shop, except:[:index], only:[:edit, :update,:new,:create,:show]
  before_action :set_product, only:[ :edit, :show, :update]


def index
  @products = Product.all
end

def new
  @product = Product.new
end

def show
  @comments = @product.comment
  @new_comment = @product.comment.new
end

def edit
end

def create
  @product = @shop.product.new(product_params)
  @product.user_id = current_user.id if current_user
  if @product.save
    redirect_to shops_path, notice: 'Product was succesfully created.'
  else
    render :new
  end
end

def update
  if @product.update_attributes(product_params)
    redirect_to products_path, notice: 'Product was succesfully updated.'
  else
    render :edit
  end
end

private
  def product_params
    params.require(:product).permit(:product_name, :price)
  end

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

    def set_product
    @product = Product.find(params[:product_id])
  end
end