require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    it "product is valid" do
      category = Category.new(name: "Apparel")
      product = Product.new(name: "t-shirt", price: 100, quantity: 2, category: category )
        expect(product).to be_valid
    end  
    
    it "name is invalid" do
        category = Category.new(name: "Apparel")
        product = Product.new(price: 100, quantity: 2, category: category )
          expect(product).to_not be_valid
      end

    it "price is invalid" do
      category = Category.new(name: "Apparel")
      product = Product.new(name: "t-shirt", quantity: 2, category: category )
        expect(product).to_not be_valid
    end

    it "quantity is invalid" do
      category = Category.new(name: "Apparel")
      product = Product.new(name: "t-shirt", price: 100, category: category )
        expect(product).to_not be_valid
    end

    it "category is invalid" do
      product = Product.new(name: "t-shirt", price: 100, quantity: 2)
        expect(product).to_not be_valid
    end

  end
end