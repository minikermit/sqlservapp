
class AddIndexUsers < ActiveRecord::Migration
  def self.up
    add_index :users, ["login"], :name => "index_users_on_login", :unique => true
    add_index :users, ["email"], :name => "index_users_on_email", :unique => true
    add_index :users, ["persistence_token"], :name => "index_users_on_persistence_token", :unique => true
  end

  def self.down
    remove_index  :users, "index_users_on_login"
    remove_index  :users, "index_users_on_email"
    remove_index  :users, "index_users_on_persistence_token"
  end
end





















