class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.integer :type
      t.string :name
      t.text :description
      t.integer :position
      t.string :link_url
      t.string :document
      t.boolean :draft

      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
