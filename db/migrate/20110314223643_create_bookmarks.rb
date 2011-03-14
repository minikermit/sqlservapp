class CreateBookmarks < ActiveRecord::Migration
  def self.up
    create_table :bookmarks do |t|
      t.integer :type
      t.string :name
      t.text :summary
      t.string :location
      t.string :target
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :bookmarks
  end
end
