# == Schema Information
#
# Table name: executed_searches
#
#  id                 :integer          not null, primary key
#  youtube_search_id  :integer
#  triggered_by       :integer
#  started_at         :datetime
#  finished_at        :datetime
#  checked_for_alerts :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class ExecutedSearchesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end
