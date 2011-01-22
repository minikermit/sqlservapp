# == Schema Information
# Schema version: 20101121151354
#
# Table name: projects
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)     not null
#  comments   :text            not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Project < ActiveRecord::Base
  attr_accessible :title, :comments

  has_many :tasklists

end

