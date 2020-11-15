require 'rails_helper'
require 'support/database_cleaner'

RSpec.feature "ProductDetails", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
    
    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity:10,
        price: 64.99
      )
    end
  end

  scenario "The user clicks on add to cart button for a product" do
    #ACT
    visit root_path

    find_button("Add", match: :first).click
   
    expect(page).to have_link 'My Cart (1)', href: '/cart'
    expect(page).to have_content 'My Cart (1)'
    

    # DEBUG
    # puts page.html
    # save_screenshot("click_add_product.png")
  

  end

end