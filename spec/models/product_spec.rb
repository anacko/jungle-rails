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


  end
end