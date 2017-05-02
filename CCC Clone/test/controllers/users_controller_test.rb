require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(first_name: 'Jack',
                        last_name: 'Sprat',
                        email: 'jsprat@nurseryrhymes.com')
  end

  def test_index
    get users_path
    assert_response 200
    assert_includes @response.body, @user.first_name
    assert_includes @response.body, @user.last_name
    assert_includes @response.body, 'users/new', 'has a new user link'
  end
end
