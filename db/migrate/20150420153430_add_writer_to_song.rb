class AddWriterToSong < ActiveRecord::Migration
  def change
    add_reference :songs, :writer, index: true
    add_foreign_key :songs, :writers
  end
end
