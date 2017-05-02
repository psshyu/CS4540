class AddFieldsToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :like_count, :integer
    add_column :videos, :dislike_count, :integer
    add_column :videos, :favorite_count, :integer
    add_column :videos, :channel_name, :string
    add_column :videos, :youtube_id, :string
    add_column :videos, :published_at, :date
    add_column :videos, :thumbnail_url, :string
  end
end
