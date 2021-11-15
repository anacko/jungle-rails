class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Welcome!'
    else
      render :new, notice: 'Login failed.'
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to [:new, :session]
  end
end
