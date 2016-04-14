class SessionsController < ApplicationController

  def new
  end

  def create
    @user = get_user_from_login
    if valid_login?
      success
    else
      error
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def get_user_from_login
    User.find_by(email: params[:session][:email].downcase)
  end

  def valid_login?
    @user && @user.authenticate(params[:session][:password])
  end

  def success
    log_in @user
    params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
    redirect_back_or(@user)
  end

  def error
    flash.now[:danger] = 'Invalid email/password combination'
    render 'new'
  end

end
