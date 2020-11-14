require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    let(:category) { Category.new( name: "Stuffed animals" ) }
    let(:product) { Product.new( name: "Teddy Bear", description: 'Plushie', category_id: category.id, quantity: 2, price: 10.99, image: "https://images.unsplash.com/photo-1562040506-a9b32cb51b94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80" ) }
    context 'a new initialized product' do
      it 'saves with all required fields filled in' do
        category.save
        product.save
        expect(product).to be_valid
      end
      it 'fails to save without a name field' do
        category.save
        product.name = nil
        product.save
        expect(product).not_to be_valid
        expect(product.errors.full_messages).to include("Name can't be blank")
      end
      it 'fails to save without a price field' do
        category.save
        product.price_cents = nil
        product.save
        expect(product).not_to be_valid
        expect(product.errors.full_messages).to include("Price can't be blank")
      end
      it 'fails to save without a quantity field' do
        category.save
        product.quantity = nil
        product.save
        expect(product).not_to be_valid
        expect(product.errors.full_messages).to include("Quantity can't be blank")
      end
      it 'fails to save without a category id specified' do
        category.save
        product.category_id = nil
        product.save
        expect(product).not_to be_valid
        expect(product.errors.full_messages).to include("Category can't be blank")
      end
    end
  end
end
