# == Schema Information
# Schema version: 20101121151354
#
# Table name: report_categories
#
#  id                        :integer(8)      not null, primary key
#  report_category_id        :integer(4)      not null
#  category_type             :string(50)      not null
#  category_type_description :string(100)
#  category_kind             :string(50)      not null
#  name                      :string(100)
#  comments                  :string(1000)
#  created_at                :datetime        not null
#  created_by                :string(50)      not null
#  updated_at                :datetime
#  updated_by                :string(50)
#  updated_with              :string(100)
#  record_validity           :boolean         not null
#  record_visibility         :boolean         not null
#

class ReportCategory < ActiveRecord::Base

# set_table_name "DIM_Report_Categories"
# set_primary_key "Report_Category_ID" 

has_many :reports

validates_uniqueness_of :name
validates_presence_of :name
validates_associated :reports

default_scope :order => "name ASC"

end




