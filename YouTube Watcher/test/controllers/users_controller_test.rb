# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  email           :string
#  admin           :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  txt_number      :string
#  verified        :boolean          default(FALSE)
#  password_digest :string
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    log_in_as(@user)
  end

  def test_profile
    get edit_user_path(@user)
    assert_response 200
    assert_includes @response.body, @user.first_name
    assert_includes @response.body, @user.last_name
    assert_includes @response.body, @user.email
  end
end
