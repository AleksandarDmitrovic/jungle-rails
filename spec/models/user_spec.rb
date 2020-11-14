require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    let(:user) { User.new( first_name: "Jhon", last_name: "Doe", email: "jdoe@gmail.com", password: "password", password_confirmation: "password") }
    context 'when creating a new user' do
      it 'saves when password and password_confirmation fields match ' do
        user.save
        expect(user).to be_valid
      end
      it 'does not save when password and password_confirmation fields do not match ' do
        user.password = "password123"
        user.password_confirmation = "passwordabc"
        user.save
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'does not save when password and password_confirmation fields are blank' do
        user.password = nil
        user.password_confirmation = nil
        user.save
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Password can't be blank")
      end
      it 'email must be unique (case insensitive)' do
        first_user = User.new( first_name: "First", last_name: "User", email: "JDOE@gmail.com", password: "password", password_confirmation: "password")
        first_user.save
        user.save
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Email has already been taken")
      end
      it 'email, first name and last name fields are required' do
        user.first_name = nil
        user.last_name = nil
        user.email = nil
        user.save
        p user.errors.full_messages
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("First name can't be blank")
        expect(user.errors.full_messages).to include("Last name can't be blank")
        expect(user.errors.full_messages).to include("Email can't be blank")
      end
      it 'does not save when password length is under 8 characters' do
        user.password = "123"
        user.password_confirmation = "123"
        user.save
        password_length = user.password.length.to_s
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
      end
    end
  end
end
