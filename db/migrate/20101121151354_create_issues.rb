class CreateIssues < ActiveRecord::Migration
  def self.up
    create_table :issues do |t|
      t.string :title
      t.integer :opened_by
      t.date :date_opened
      t.date :date_fixed
      t.integer :priority
      t.integer :status
      t.text :comments
      t.integer :assigned_to

      t.timestamps
    end
  end

  def self.down
    drop_table :issues
  end
end
