# == Schema Information
# Schema version: 20101121151354
#
# Table name: reports
#
#  id                 :integer(8)      not null, primary key
#  reference          :integer(4)      not null
#  name               :string(50)      not null
#  report_category_id :integer(4)      not null
#  comments           :string(1000)
#  created_at         :datetime        not null
#  created_by         :string(50)      not null
#  updated_at         :datetime
#  updated_by         :string(50)
#  updated_with       :string(100)
#  record_validity    :boolean         not null
#  record_visibility  :boolean         not null
#  position           :integer(4)
#

class Report < ActiveRecord::Base

belongs_to :report_category, :foreign_key => "report_category_id"
has_many :report_lines

acts_as_list    :scope => :report_category
# default_scope :order => "report_category_id ASC, position ASC"

validates_uniqueness_of :reference
validates_uniqueness_of :name
validates_presence_of :reference
validates_presence_of :name
validates_presence_of :report_category
validates_numericality_of :reference
validates_associated :report_lines

end

