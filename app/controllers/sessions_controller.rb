class SessionsController < ApplicationController

  def new
  end

  def create
    user = get_user_from_login
    if valid_login(user)
      success(user)
    else
      error
    end
  end

  def destroy
  end

  private

  def get_user_from_login
    User.find_by(email: params[:session][:email].downcase)
  end

  def valid_login(user)
    user && user.authenticate(params[:session][:password])
  end

  def success(user)
    log_in user
    redirect_to user
  end

  def error
    flash.now[:danger] = 'Invalid email/password combination'
    render 'new'
  end

end
