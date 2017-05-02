class RefactorAlerts < ActiveRecord::Migration[5.0]
  def change
    remove_column :alerts, :user_id, :integer
    add_column :alerts, :youtube_search_id, :integer
    add_column :alerts, :criterion, :integer, default: 0
  end
end
