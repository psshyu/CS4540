class AddAlertFlagToYoutubeSearches < ActiveRecord::Migration[5.0]
  def change
    add_column :youtube_searches, :alert_on_new_result, :boolean, default: :false
  end
end
