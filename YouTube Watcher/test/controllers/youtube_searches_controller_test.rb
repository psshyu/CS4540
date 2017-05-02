# == Schema Information
#
# Table name: youtube_searches
#
#  id                  :integer          not null, primary key
#  name                :string
#  search_terms        :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :integer
#  alert_on_new_result :boolean          default(FALSE)
#

require 'test_helper'

class YoutubeSearchesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    log_in_as(@user)
  end

  test "should get new" do
    get new_youtube_search_path
    assert_response :success
  end
end
