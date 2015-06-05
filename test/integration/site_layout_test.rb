require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  def setup
    @user       = users(:andrew)
    @other_user = users(:lana)
  end

  test 'layout_links' do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", signup_path
    get signup_path
    assert_select "title", full_title("Sign up")
  end

  test 'logged in layout_links' do
    get root_path
    log_in_as(@user)
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", user_path(@user) 
    assert_select "a[href=?]", edit_user_path(@user)
    get signup_path
    assert_select "title", full_title("Sign up")
  end

end
