# == Schema Information
#
# Table name: videos
#
#  id                 :integer          not null, primary key
#  title              :string
#  url                :string
#  view_count         :integer
#  comment_count      :integer
#  executed_search_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  like_count         :integer
#  dislike_count      :integer
#  favorite_count     :integer
#  channel_name       :string
#  youtube_id         :string
#  published_at       :date
#  thumbnail_url      :string
#

require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
