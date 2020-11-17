require 'rails_helper'
require 'support/database_cleaner'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      @category = Category.create!( name: "Toys" )
      # Setup at least two products with different quantities, names, etc
      @product1 = Product.create!(name: "Teddy Bear", description: 'Plushie', category_id: @category.id, quantity: 2, price: 10.00, image: "https://images.unsplash.com/photo-1562040506-a9b32cb51b94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80" )
      @product2 = Product.create!(name: "Toy Car", description: 'hot wheels toy car', category_id: @category.id, quantity: 5, price: 4.99, image: "https://media.istockphoto.com/photos/pontiac-gto-hot-wheels-diecast-toy-car-picture-id545788690" )
      # Setup at least one product that will NOT be in the order
    end
    # pending test 1
    it 'deducts quantity from products based on their line item quantities' do
      @product1_stock = @product1.quantity
   
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(email: 'jhonsmith@gmail.com', total_cents: 2000, stripe_charge_id: "ch_1HoIcxJS3zNn7w5dw2b6Swh1")
      # 2. build line items on @order
      @quantity_ordered = 2
      @order.line_items.new(product_id: @product1.id, quantity: @quantity_ordered, item_price_cents: 1000, total_price_cents: 1000 * @quantity_ordered, order_id: @order.id)

      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # p @order
      # p @order.line_items
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to eq(@product1_stock - @quantity_ordered)

    end
    # pending test 2
    it 'does not deduct quantity from products that are not in the order' do
      @product2_stock = @product2.quantity
    
      @order = Order.new(email: 'jhonsmith@gmail.com', total_cents: 2000, stripe_charge_id: "ch_1HoIcxJS3zNn7w5dw2b6Swh1")
     
      @quantity_ordered = 2
      @order.line_items.new(product_id: @product1.id, quantity: @quantity_ordered, item_price_cents: 1000, total_price_cents: 1000 * @quantity_ordered, order_id: @order.id)

      @order.save!
 
      @product1.reload
      @product2.reload

      expect(@product2.quantity).to eq(@product2_stock)
    end
  end
end