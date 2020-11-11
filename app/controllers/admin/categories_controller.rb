class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"], password: ENV["HTTP_BASIC_PASSWORD"]

  def index
    @category_array = Category.order(id: :desc).all
    # @category_array = Category.joins(:products).order(id: :desc).group("id").all
    @categories = @category_array.map { |category| { id: category.id, name: category.name, product_count: Product.where(category_id: category.id).count}}
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name,
    )
  end

end
