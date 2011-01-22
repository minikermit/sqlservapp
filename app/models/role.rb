# == Schema Information
# Schema version: 20101121151354
#
# Table name: roles
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)     not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Role < ActiveRecord::Base

  has_many :assignments
  has_many :users, :through => :assignments

end
