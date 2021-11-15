class User < ActiveRecord::Base

  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  def authenticate_with_credentials (email, password)
    @user = User.find_by_email(email.strip.downcase)
    if @user
      @user = @user.authenticate(password) if @user
      @user
    else
      false
    end
  end


end
