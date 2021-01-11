require 'rails_helper'
require 'pp'
RSpec.describe Product, type: :model do

  describe 'Validations' do

    before(:each) do
      @category = Category.create(name: 'foo')
      @product = Product.new(name: 'bar', price_cents: 10, quantity: 10, category_id: @category.id)
    end

    describe "name" do
      it "Should create new product" do
        expect(@product.valid?).to equal(true)
        @product.valid?
        expect(@product.errors.full_messages).to include()

      end

      it "Should be error if name is null" do
       @product.name = nil
       @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank"
        )
      end
      it "Should be error if price is null" do
        @product.price_cents = nil
         @product.valid?
         expect(@product.errors.full_messages).to include("Price cents is not a number"
         )
       end
       it "Should be error if quantity is null" do
        @product.quantity = nil
        @product.valid?
         expect(@product.errors.full_messages).to include("Quantity can't be blank")
       end
       it "Should be error if category is null" do
        @product.category_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end


    end
  end
end