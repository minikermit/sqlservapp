# == Schema Information
# Schema version: 20101121151354
#
# Table name: activity_logs
#
#  id         :integer(4)      not null, primary key
#  session_id :string(255)     not null
#  user_id    :integer(4)      not null
#  browser    :string(255)     not null
#  ip_address :string(255)     not null
#  controller :string(255)     not null
#  action     :string(255)     not null
#  request_at :datetime        not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class ActivityLog < ActiveRecord::Base
end
