require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it 'should be auto-assigned by Ative Record for saved records' do
      @category = Category.new(name: "Utilities")
      @product = Product.new(
        name: "Reusable Auto-sealing Envelope",
        price: 10,
        quantity: 1000,
        category: @category
      )
      @product.save!
      expect(@product.id).to be_present
    end

    it 'should not record products with missing name' do
      @category = Category.new(name: "Utilities")
      @product = Product.new(
        name: nil,
        price: 10,
        quantity: 1000,
        category: @category
      )
      expect { @product.save! }.to raise_error { |error| @product.errors.full_messages.include?(error) }

    end

    it 'should not record products with missing price' do
      @category = Category.new(name: "Utilities")
      @product = Product.new(
        name: "Reusable Auto-sealing Envelope",
        #price: nil,
        quantity: 1000,
        category: @category
      )
      expect { @product.save! }.to raise_error { |error| @product.errors.full_messages.include?(error) }
    end

    it 'should not record products with missing quantity' do
      @category = Category.new(name: "Utilities")
      @product = Product.new(
        name: "Reusable Auto-sealing Envelope",
        price: 10,
        quantity: nil,
        category: @category
      )
      expect { @product.save! }.to raise_error { |error| @product.errors.full_messages.include?(error) }
    end

    it 'should not record products with missing category' do
      @category = Category.new(name: "Utilities")
      @product = Product.new(
        name: "Reusable Auto-sealing Envelope",
        price: 10,
        quantity: 1000,
        category: nil
      )
      expect { @product.save! }.to raise_error { |error| @product.errors.full_messages.include?(error) }
    end


  end
end