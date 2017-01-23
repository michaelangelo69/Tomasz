class ProductsController < ApplicationController
before_action :set_shop

def new
    @product = Product.new
 end

def show
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
        params.require(:product).permit(:name, :price)
      end

      def set_shop
        @shop = Shop.find(params[:shop_id])
      end

end
