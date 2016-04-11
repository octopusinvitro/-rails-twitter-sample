ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  include ApplicationHelper

  def is_logged_in?
    !session[:user_id].nil?
  end

  def log_in_as(user, options = {})
    integration_test? ?
      integration_test_login(user, options) :
      normal_test_login(user)
  end

  private

    def integration_test?
      defined?(post_via_redirect)
    end

    def integration_test_login(user, options)
      password    = options[:password]    || 'password'
      remember_me = options[:remember_me] || '1'
      post login_path, session: { email:       user.email,
                                  password:    password,
                                  remember_me: remember_me }
    end

    def normal_test_login(user)
      session[:user_id] = user.id
    end

end
