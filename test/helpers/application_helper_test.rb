# frozen_string_literal: true

require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'Full page title is base title if no specific page name' do
    assert_equal full_title, base_title
  end

  test 'Full page title is page name plus base title if specific page name' do
    assert_equal full_title('About'), "About | #{base_title}"
  end
end
