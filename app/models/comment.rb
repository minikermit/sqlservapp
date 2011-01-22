# == Schema Information
# Schema version: 20101121151354
#
# Table name: comments
#
#  id          :integer(4)      not null, primary key
#  body        :text            not null
#  tasklist_id :integer(4)      not null
#  user_id     :integer(4)      not null
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Comment < ActiveRecord::Base

    belongs_to :tasklist
    belongs_to :user

    default_value_for :user_id, User.current

end


