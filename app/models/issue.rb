# == Schema Information
# Schema version: 20101121151354
#
# Table name: issues
#
#  id          :integer(4)      not null, primary key
#  title       :string(255)     not null
#  opened_by   :integer(4)      not null
#  date_opened :date            not null
#  date_fixed  :date            not null
#  priority    :integer(4)      not null
#  status      :integer(4)      not null
#  comments    :text            not null
#  assigned_to :integer(4)      not null
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Issue < ActiveRecord::Base

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

  # creates hash for nice names in view
  PRIORITY_NAMES = { 1 => 'Very high',
                     2 => 'High',
                     3 => 'Moderate',
                     4 => 'Low',
                     5 => 'Very Low'}

  STATUS_NAMES = {     1 => 'To start',
                       2 => 'To assign',
                       3 => 'Work in progress',
                       4 => 'Done',
                       5 => 'Discarded',
                       6 => 'Reopened',
                       7 => 'To review',
                       8 => 'To test'}

  def priority_name
    PRIORITY_NAMES[self.priority]
  end

  def status_name
    STATUS_NAMES[self.status]
  end

  # moves hash to an array for select box
  def self.priority_name_options
    PRIORITY_NAMES.to_a.sort
  end

  def self.status_name_options
    STATUS_NAMES.to_a.sort
  end

end
