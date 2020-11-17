require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    # validation examples here

    it "user is valid" do

      user = User.new(name: "John", email: "john@hotmail.com", password: "Johnny123",password_confirmation: "Johnny123"  )
        expect(user).to be_valid
    end  
    
    it "password is invalid" do

      user = User.new(name: "John", email: "john@hotmail.com", password: "Johnny123", password_confirmation: "johnny124" )
        expect(user).to_not be_valid
    end  

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it "user is authenticated" do
      
      user = User.create(name: "John", email: "john@hotmail.com", password: "Johnny123", password_confirmation: "Johnny123")

      authenticate = User.authenticate_with_credentials("john@hotmail.com", "Johnny123")
        expect(authenticate.email).to be_present
    end  

    it "user with spaces is valid" do
      
      user = User.create(name: "John", email: "john@hotmail.com", password: "Johnny123", password_confirmation: "Johnny123")

      authenticate = User.authenticate_with_credentials(" john@hotmail.com ", "Johnny123")
        expect(authenticate.email).to be_present
    end  
    
    it "user with wrong case is valid" do
      
      user = User.create(name: "John", email: "john@hotmail.com", password: "Johnny123", password_confirmation: "Johnny123")

      authenticate = User.authenticate_with_credentials(" jOHn@hOTMail.com ", "Johnny123")
        expect(authenticate.email).to be_present
    end  
 
  end

end

