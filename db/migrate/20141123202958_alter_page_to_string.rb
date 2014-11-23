class AlterPageToString < ActiveRecord::Migration
  def self.up
    change_table :songs do |t|
      t.change :page, :string
    end
  end
  def self.down
    change_table :songs do |t|
      t.change :page, :integer
    end
  end
end
