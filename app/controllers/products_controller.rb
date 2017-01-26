class ProductsController < ApplicationController
before_action :set_shop, except:[:index]

def index
    @products = Product.all
 end

def new
    @product = Product.new
 end

def show
    @product = Product.find(params[:id])
    @comments = @product.comment
    @new_comment = @product.comment.new
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


  private

      def product_params
        params.require(:product).permit(:product_name, :price)
      end

      def set_shop
        @shop = Shop.find(params[:shop_id])
      end

end