require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @michael = users(:michael)
    @viktor  = users(:viktor)
  end

  test "should get new" do
    get new_user_path
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@michael)
    assert_not flash.empty?
    assert_redirected_to new_user_session_path
  end

  test "should redirect update when not logged in" do
    patch user_path(@michael), params: { user: { first_name: @michael.first_name } }
    assert_not flash.empty?
    assert_redirected_to new_user_session_path
  end

  test "should redirect delete when not logged in" do
    delete user_path(@michael)
    assert_not flash.empty?
    assert_redirected_to new_user_session_path
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@viktor)
    get edit_user_path(@michael)
    assert_not flash.empty?
    assert_redirected_to root_path
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@viktor)
    patch user_path(@michael), params: { user: { first_name: @michael.first_name } }
    assert_not flash.empty?
    assert_redirected_to root_path
  end

  test "should redirect delete when logged in as wrong user" do
    log_in_as(@viktor)
    delete user_path(@michael)
    assert_not flash.empty?
    assert_redirected_to root_path
  end
end
