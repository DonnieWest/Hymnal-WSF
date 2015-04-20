class CreateWriters < ActiveRecord::Migration
  def change
    create_table :writers do |t|
      t.string :name
      t.text :details
      t.references :song, index: true

      t.timestamps null: false
    end
    add_foreign_key :writers, :songs
  end
end
