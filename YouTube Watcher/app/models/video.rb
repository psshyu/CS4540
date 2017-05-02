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

# represents a video that exists on Youtube
class Video < ApplicationRecord
  belongs_to :executed_search

  validates :title, presence: true
  validates :view_count, presence: true
  validates :comment_count, presence: true
end
