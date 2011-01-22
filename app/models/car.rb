# == Schema Information
# Schema version: 20101121151354
#
# Table name: cars
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)     not null
#  brand      :string(255)     not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Car < ActiveRecord::Base
end
