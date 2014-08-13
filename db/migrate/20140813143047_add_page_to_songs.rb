class AddPageToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :page, :integer
  end
end
