class ReviewsController < ApplicationController

  before_filter :authorize

  def create
    # @review = Product.where().has_many
    @review = Review.new(review_params)
    @review.user_id = session[:user_id]
    @review.product_id = params[:product_id]
  
    if @review.save
      redirect_to "/products/#{params[:product_id]}", notice: 'Review created!'
    else
      redirect_to "/products/#{params[:product_id]}"
    end

  end

  private

  def review_params
    params.require(:products).permit(
      :description,
      :rating
    )
  end

end
