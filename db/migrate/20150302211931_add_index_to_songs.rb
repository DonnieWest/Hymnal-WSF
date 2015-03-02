class AddIndexToSongs < ActiveRecord::Migration
  def change
    add_index :songs, :page
  end
end
