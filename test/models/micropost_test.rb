require 'test_helper'

class MicropostTest < ActiveSupport::TestCase

  def setup
    @user      = users(:michael)
    @micropost = @user.microposts.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "user id should be present" do
    @micropost.user_id = nil
    assert @micropost.invalid?
  end

  test "content should be present" do
    @micropost.content = "   "
    assert @micropost.invalid?
  end

  test "content should be maximum 140 characters long" do
    @micropost.content = "a" * 141
    assert @micropost.invalid?
  end

end
