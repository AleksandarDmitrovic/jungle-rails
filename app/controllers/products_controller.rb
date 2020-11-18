class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    review_info = Review.where( product_id: params[:id]).reverse
    @reviews = review_info.map { |review| 
    {
    id: review.id,
    description: review.description, 
    rating: review.rating, 
    user: User.select('id', 'first_name', 'last_name').where(id: review.user_id) 
    }}
    @user = session[:user_id]
  end

end