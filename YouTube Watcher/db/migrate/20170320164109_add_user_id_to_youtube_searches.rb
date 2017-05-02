class AddUserIdToYoutubeSearches < ActiveRecord::Migration[5.0]
  def change
    add_column :youtube_searches, :user_id, :integer
  end
end
