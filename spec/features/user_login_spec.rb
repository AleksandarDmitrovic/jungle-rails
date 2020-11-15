require 'rails_helper'
require 'support/database_cleaner'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @user = User.create! first_name: "Jhon", last_name: "Smith", email: "jsmith@gmail.com", password: "password", password_confirmation: "password" 
  end
  
  scenario "They see all products" do
    # ACT
    visit root_path

    find_link("Login").click
    
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password

    page.find('input.btn').click

    # DEBUG / VERIFY
    # puts page.html
    # sleep(1)
    # save_screenshot("user_login.png")

    expect(page).to have_link('Logout')
    
  end

end
 