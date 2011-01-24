# == Schema Information
# Schema version: 20101121151354
#
# Table name: users
#
#  id                  :integer(4)      not null, primary key
#  name                :string(255)     not null
#  shortname           :string(255)     not null
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#  login               :string(255)     not null
#  email               :string(255)     not null
#  crypted_password    :string(255)     not null
#  password_salt       :string(255)     not null
#  persistence_token   :string(255)     not null
#  single_access_token :string(255)     not null
#  perishable_token    :string(255)     not null
#  login_count         :integer(4)      not null
#  failed_login_count  :integer(4)      not null
#  last_request_at     :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  current_login_ip    :string(255)
#  last_login_ip       :string(255)
#

class User < ActiveRecord::Base

 attr_accessible :name, :shortname, :email, :login, :password, :password_confirmation 

 acts_as_authentic  do |config|
  # Add custom configuration options here.
  config.logged_in_timeout = 120.minutes
  config.crypto_provider = Authlogic::CryptoProviders::MD5
 end

 has_many :tasklists, :dependent => :destroy
 has_many :comments
 has_many :assignments
 has_many :roles, :through => :assignments
 has_many :custom_menus
 has_many :menus, :through => :custom_menus
 has_many :invoices

 validates_presence_of :name, :shortname , :email, :login
 validates_associated :tasklists
 validates_length_of :login, :within => 3..40
 validates_uniqueness_of :login

 scope :limit, lambda { |limit| {:limit => limit}}
 scope :search_for_name, lambda { |term| {:conditions => ['lower(name) LIKE ?', "%#{term.downcase}%"]}}

 def role_symbols
  roles.map do |role|
    role.name.underscore.to_sym
  end
 end

 def self.current
    Thread.current[:user]
 end

 def self.current=(user)
    Thread.current[:user]=user
 end

end




