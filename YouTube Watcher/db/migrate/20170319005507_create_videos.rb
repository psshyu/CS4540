class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :url
      t.integer :view_count
      t.integer :comment_count
      t.integer :youtube_search_id
      t.timestamps
    end
  end
end
