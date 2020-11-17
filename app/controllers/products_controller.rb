class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    review_info = Review.where( product_id: params[:id])
    @reviews = review_info.map { |review| 
    { description: review.description, 
    rating: review.rating, 
    user: User.select('first_name', 'last_name').where(id: review.user_id) 
    }}
  end

end

# <%= form_for [@organization, @venue] do |f| %>
#   <div class="form-group">
#    <%= form.label :name %>
#    <%= form.text_field :name, class: 'form-control' %>
#  </div>

#  <div class="form-group">
#    <%= form.label :description %>
#    <%= form.text_area :description, class: 'form-control' %>
#  </div>
# </div>