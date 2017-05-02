require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @michael = users(:michael)
    log_in_as(@michael)
  end

  def test_dashboard_is_root
    get root_path
    assert_template 'dashboard/index'
  end

  def test_about
    get '/static_pages/about'
    assert_response 200
    assert_includes @response.body, 'My name is'
  end

  def test_help
    get '/static_pages/help'
    assert_response 200
    assert_includes @response.body, 'email'
  end

  def test_login_page
    get login_path
    assert_response 200
    assert_template 'user_sessions/new'
  end
end
