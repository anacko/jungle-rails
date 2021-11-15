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

    it 'should not record new user with unmatching passwords' do
      @user = User.new(
        first_name: "First",
        last_name: "Last",
        email: "user@email.com",
        password: "password_1",
        password_confirmation: "password_2"
      )
      expect { @user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  
    it 'should not record new user with email already taken (case insensitive)' do
      @user_1 = User.new(
        first_name: "First",
        last_name: "Last",
        email: "user@email.com",
        password: "password",
        password_confirmation: "password"
      )
      @user_2 = User.new(
        first_name: "First",
        last_name: "Last",
        email: "USER@email.com",
        password: "password",
        password_confirmation: "password"
      )
      @user_1.save!
      expect { @user_2.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  
    it 'should not record new user with short password' do
      @user = User.new(
        first_name: "First",
        last_name: "Last",
        email: "user@email.com",
        password: "pass",
        password_confirmation: "pass"
      )
      expect { @user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

  end

  describe 'authenticate_with_credentials' do
    
    it 'retrieves user when provided correct credentials' do
      @user = User.new(
        first_name: "First",
        last_name: "Last",
        email: "user@email.com",
        password: "password",
        password_confirmation: "password"
      )
      @user.save!
      expect(@user.authenticate_with_credentials("user@email.com", "password")).to eq(@user)
    end

    it 'does not retrieve user when provided incorrect email' do
      @user = User.new(
        first_name: "First",
        last_name: "Last",
        email: "user@email.com",
        password: "password",
        password_confirmation: "password"
      )
      @user.save!
      expect(@user.authenticate_with_credentials("user_not_in_DB@email.com", "password")).to be(false)
    end

    it 'does not retrieve user when provided incorrect password' do
      @user = User.new(
        first_name: "First",
        last_name: "Last",
        email: "user@email.com",
        password: "password",
        password_confirmation: "password"
      )
      @user.save!
      expect(@user.authenticate_with_credentials("user@email.com", "wrong_password")).to be(false)
    end

    it 'retrieve user when provided blank spaces around email' do
      @user = User.new(
        first_name: "First",
        last_name: "Last",
        email: "user@email.com",
        password: "password",
        password_confirmation: "password"
      )
      @user.save!
      expect(@user.authenticate_with_credentials(" user@email.com", "password")).to eq(@user)
    end

  end

end