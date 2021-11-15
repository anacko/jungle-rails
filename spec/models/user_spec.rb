require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    it 'should be auto-assigned by Ative Record for saved records' do
      @user = User.new(
        first_name: "First",
        last_name: "Last",
        email: "user@email.com",
        password: "password",
        password_confirmation: "password"
      )
      @user.save!
      expect(@user.id).to be_present
    end
  
  end
end