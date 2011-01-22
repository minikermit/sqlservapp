# == Schema Information
# Schema version: 20101121151354
#
# Table name: commands
#
#  id         :integer(4)      not null, primary key
#  execute    :string(255)     not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Command < ActiveRecord::Base
end

