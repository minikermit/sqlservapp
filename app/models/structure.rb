# == Schema Information
# Schema version: 20101121151354
#
# Table name: structures
#
#  id                :integer(8)      not null, primary key
#  account_plan_id   :integer(8)      not null
#  report_line_id    :string(50)
#  include_in_report :integer(2)
#  created_at        :datetime        not null
#  created_by        :string(50)      not null
#  updated_at        :datetime
#  updated_by        :string(50)
#  updated_with      :string(100)
#  comments          :string(50)
#

class Structure < ActiveRecord::Base

belongs_to :account_plan
belongs_to :report_line

validates_uniqueness_of :report_line_id, :scope => :account_plan_id

end



