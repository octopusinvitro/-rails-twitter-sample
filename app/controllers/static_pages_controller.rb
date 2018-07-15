# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    @micropost, @feed_items = build_home_content if logged_in?
  end

  def help; end

  def about; end

  def contact; end

  private

  def build_home_content
    [
      current_user.microposts.build,
      current_user.feed.paginate(page: params[:page])
    ]
  end
end
