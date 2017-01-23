class CommentsController < ApplicationController

before_action :set_product

  def new
    @product = Product.find(params[:product_id])
    @comment = Comment.new
  end

  def create
    comment = @product.comment.new(comment_params)
    comment.user_id = current_user.id if current_user
    if comment.save
      redirect_to request.referrer, notice: "Comment was successfully created."
    else
      redirect_to request.referrer
    end
  end

  private

    def set_product
      @product = Product.find(params[:product_id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end


end

