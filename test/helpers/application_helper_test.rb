require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         'Twitter Clone App' 
    assert_equal full_title("Help"), 'Help | Twitter Clone App'
  end
end
