# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  private

  def logged_in_user
    ask_to_log_in unless logged_in?
  end

  def ask_to_log_in
    store_location
    flash[:danger] = 'Please log in.'
    redirect_to login_url
  end
end
