class AddFkOnBookmarksMovie < ActiveRecord::Migration[7.1]
  def change
    change_column_null :bookmarks, :movie_id, false
    add_foreign_key(:bookmarks, :movies, on_delete: :restrict) unless foreign_key_exists?(:bookmarks, :movies)
  end
end
