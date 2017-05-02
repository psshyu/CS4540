class CreateExecutedSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :executed_searches do |t|
      t.integer :youtube_search_id
      t.integer :triggered_by
      t.timestamp :started_at
      t.timestamp :finished_at
      t.boolean :checked_for_alerts

      t.timestamps
    end
  end
end
