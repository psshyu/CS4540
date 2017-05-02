require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  def setup
    @michael = users(:michael)
    log_in_as(@michael)
  end

  test "should get index" do
    get root_path
    assert_template 'dashboard/index'
  end

end
