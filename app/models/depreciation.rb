# == Schema Information
# Schema version: 20101121151354
#
# Table name: depreciations
#
#  id             :integer(4)      not null, primary key
#  type_id        :integer(4)      not null
#  name           :string(255)     not null
#  currency       :string(255)     not null
#  amount         :integer         not null
#  event_date     :date            not null
#  period_id      :integer(4)      not null
#  debit_account  :string(255)     not null
#  credit_account :string(255)     not null
#  comments       :text            not null
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

class Depreciation < ActiveRecord::Base

  validates_numericality_of :amount
  validates_format_of :debit_account, :credit_account,
                      :with => /[0-9]{7}\/[0-9]{3}.[0-9]{3}.[0-9]{3}\z/,
                      :message => '- You have to enter the account number in the correct Olympic format 1234567/123.123.123'

  # validates_length_of :period_id, :is => 6


  # creates hash for nice names in view
  TYPE_NAMES = { 1 => 'Depreciation against invoice',
                     2 => 'Correction',
                     3 => 'Activation of invoice',
                     4 => 'Building of reserves -',
                     5 => 'Other'}

  def type_name
    TYPE_NAMES[self.type_id]
  end

  # moves hash to an array for select box
  def self.type_id_name_options
    TYPE_NAMES.to_a.sort
  end

end
