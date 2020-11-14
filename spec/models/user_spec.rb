require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    let(:user) { User.new( first_name: "Jhon", last_name: "Doe", email: "jdoe@gmail.com", password: "123", password_confirmation: "123") }
    context 'when creating a new user' do
      it 'saves when password and password_confirmation fields match ' do
        user.save
        expect(user).to be_valid
      end
      it 'do not save when password and password_confirmation fields do not match ' do
        user.password = "123"
        user.password_confirmation = "123abc"
        user.save
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'do not save when password and password_confirmation fields are blank' do
        user.password = nil
        user.password_confirmation = nil
        user.save
        p user.errors.full_messages
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Password can't be blank")
      end
    end
  end
end
