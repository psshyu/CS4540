# == Schema Information
#
# Table name: alerts
#
#  id                :integer          not null, primary key
#  status            :integer
#  delivered_at      :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  youtube_search_id :integer
#  criterion         :integer          default("change_in_top_x")
#  message           :string
#  sns_message_id    :string
#

require 'test_helper'

class AlertsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end
