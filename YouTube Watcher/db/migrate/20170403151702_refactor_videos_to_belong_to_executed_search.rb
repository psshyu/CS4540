class RefactorVideosToBelongToExecutedSearch < ActiveRecord::Migration[5.0]
  def change
    rename_column :videos, :youtube_search_id, :executed_search_id
  end
end
