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

class AlertTest < ActiveSupport::TestCase

  test "new attributes exist" do
    assert Alert.column_names.include?('message')
    assert Alert.column_names.include?('criterion')
    assert Alert.column_names.include?('youtube_search_id')
  end

  test "enumerated attribute criterion works" do
    a = Alert.new
    assert a.criterion = 'change_in_top_x'
    assert Alert.change_in_top_x.respond_to?(:count)
    assert Alert.change_in_top_x.respond_to?(:first)
  end

  test "Amazon Ruby SDK is installed" do
    assert Aws::SNS::Client.new
  end

  test "Amazon Ruby SDK is configured with credentials" do
    assert Aws::SNS::Topic.new(Alert::AWS_SNS_TOPIC)
  end

  test "Alert publishing works" do
    yts = youtube_searches(:farmall_tractors)
    a = Alert.new(youtube_search: yts, message: "test msg from #{Dir.pwd}")
    a.deliver!

    assert a.delivered?
    assert a.delivered_at

    tries = 0
    message = nil
    while tries < 5 do
      message = Message.find_by(author: a.sns_message_id)
      break if message
      tries += 1
      sleep(2)
    end

    assert message
  end

end
