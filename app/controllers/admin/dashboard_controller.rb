class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"], password: ENV["HTTP_BASIC_PASSWORD"]

  def show
    @product_count = Product.sum("quantity")
    @category_count = Category.all.length
  end
end
