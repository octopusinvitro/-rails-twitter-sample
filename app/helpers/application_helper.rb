# frozen_string_literal: true

module ApplicationHelper
  def base_title
    'Ruby on Rails Tutorial Sample App'
  end

  def full_title(page_title = '')
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end
end
