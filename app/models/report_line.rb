# == Schema Information
# Schema version: 20101121151354
#
# Table name: report_lines
#
#  id                :integer(8)      not null, primary key
#  report_id         :integer(4)      not null
#  line_id           :string(50)      not null
#  parent_line_id    :string(50)
#  line_caption      :string(50)
#  uo                :string(1)
#  position          :integer(2)
#  record_validity   :boolean         not null
#  record_visibility :boolean         not null
#  created_at        :datetime        not null
#  created_by        :string(50)      not null
#  updated_at        :datetime
#  updated_by        :string(50)
#  updated_with      :string(100)
#  line_morphing     :string(50)
#  line_style        :integer(4)
#

class ReportLine < ActiveRecord::Base

  belongs_to :report
  has_many :structures
  has_many :account_plans, :through => :structures

  acts_as_list    :scope => :report
  default_scope :order => "report_id ASC, position ASC"

  validates_uniqueness_of :line_id
  validates_presence_of :line_id , :line_caption

end



