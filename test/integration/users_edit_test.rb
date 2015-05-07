require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:andrew)
  end

  test 'unsuccessful edit' do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name: "", email: "email@invalid", 
                                    password: "not", password_confirmation: "matching" }
    assert_template 'users/edit'
  end 

#  test 'successful edit' do
#    log_in_as(@user)
#    get edit_user_path(@user)
#    assert_template 'users/edit'
#    name = "New Username"
#    email = "valid@email.com"
#    patch user_path(@user), user: { name: name, email: email,
#                                   password: "", password_confirmation: "" }
#    assert_not flash.empty?
#    assert_redirected_to @user
#    @user.reload
#    assert_equal @user.name, name
#    assert_equal @user.email, email
#  end

  test 'successful edit with friendly forwarding' do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    name = "Test Name"
    email = "test@email.edu"
    patch user_path(@user), user: { name: name, email: email,
                                    password: "password", password_confirmation: "password" } 
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal @user.name, name
    assert_equal @user.email, email
  end

end
