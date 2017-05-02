class CreateYoutubeSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :youtube_searches do |t|
      t.string :name
      t.string :search_terms
      t.timestamps
    end
  end
end
