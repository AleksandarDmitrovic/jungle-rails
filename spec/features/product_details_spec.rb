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

  scenario "The user clicks on a product" do
    #ACT
    visit root_path

    expect(page).to have_css 'article.product', count: 10
    find_link("Details", match: :first).click
   
    expect(page).to have_css 'article.product-detail', count: 1
    expect(page).to have_css 'img.main-img'

    # DEBUG
    # puts page.html
    # sleep(1)
    # save_screenshot("click_product_details.png")
    # save_screenshot("click_product_details_image_rendered.png")

  end

end
