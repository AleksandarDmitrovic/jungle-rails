require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context 'given a new initiallized product' do
      it 'will save with all required fields filled in' do
        @category = Category.new( name: "Stuffed animals" )
        @category.save
        # p @category
        @product = Product.new(
          name: "Teddy Bear", description: 'Plushie', category_id: @category.id, quantity: 2, price: 10.99, image: "https://images.unsplash.com/photo-1562040506-a9b32cb51b94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80" )
        @product.save
          # p @product
        expect(@product).to be_valid
      end
      it 'will fail to create a product without a name field' do
        @category = Category.new( name: "Stuffed animals" )
        @category.save
        # p @category
        @product = Product.new(
          description: 'Plushie', category_id: @category.id, quantity: 2, price: 10.99, image: "https://images.unsplash.com/photo-1562040506-a9b32cb51b94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80" )
        @product.save
          # p @product.errors.full_messages
        expect(@product).not_to be_valid
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it 'will fail to create a product without a price field' do
        @category = Category.new( name: "Stuffed animals" )
        @category.save
       
        @product = Product.new(
          name: "Teddy Bear", description: 'Plushie', category_id: @category.id, quantity: 2, image: "https://images.unsplash.com/photo-1562040506-a9b32cb51b94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80" )
        @product.save
          # p @product.errors.full_messages
        expect(@product).not_to be_valid
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'will fail to create a product without a quantity field' do
        @category = Category.new( name: "Stuffed animals" )
        @category.save
       
        @product = Product.new(
          name: "Teddy Bear", description: 'Plushie', category_id: @category.id, price: 10.99, image: "https://images.unsplash.com/photo-1562040506-a9b32cb51b94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80" )
        @product.save
          p @product.errors.full_messages
        expect(@product).not_to be_valid
        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end
      it 'will fail to create a product without a category id specified' do
        @category = Category.new( name: "Stuffed animals" )
        @category.save
       
        @product = Product.new(
          name: "Teddy Bear", description: 'Plushie', quantity: 2, price: 10.99, image: "https://images.unsplash.com/photo-1562040506-a9b32cb51b94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80" )
        @product.save
          p @product.errors.full_messages
        expect(@product).not_to be_valid
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
    end
  end
end
