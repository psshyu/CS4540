require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "login with invalid information" do
    get login_path
    assert_template 'user_sessions/new'
    post login_path, params: { user_session: { email: '', password: '' } }
    assert_template 'user_sessions/new'
    assert_not flash.empty?
    get root_path
    assert_not flash.empty?
  end

  test "login with valid information" do
    get login_path
    assert_template 'user_sessions/new'
    post login_path, params: { user_session: { email: @user.email, password: 'foobar' } }
    assert_redirected_to root_path
    follow_redirect!
    assert_select "a[href=?]", logout_path
  end

  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { user_session: { email: @user.email, password: 'foobar' } }
    assert is_logged_in?
    assert_redirected_to root_path
    follow_redirect!
    assert_select "a[href=?]", logout_path
    delete logout_path
    assert_not is_logged_in?
    follow_redirect!
    assert_template 'user_sessions/new'
  end
end
