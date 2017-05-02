require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def test_home_is_root
    get root_path
    assert_template 'static_pages/home'
  end

  def test_home
    get '/home'
    assert_response 200
    assert_select 'a[href=?]', help_path
    assert_select 'a[href=?]', about_path
  end

  def test_about
    get '/about'
    assert_response 200
    assert_includes @response.body, 'My name is'
  end

  def test_help
    get '/help'
    assert_response 200
    assert_includes @response.body, 'email'
  end
end
