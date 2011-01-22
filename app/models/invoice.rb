# == Schema Information
# Schema version: 20101121151354
#
# Table name: invoices
#
#  id                              :integer(4)      not null, primary key
#  identification                  :integer(4)      not null
#  counterparty                    :string(255)     not null
#  account                         :string(255)     not null
#  name                            :string(255)     not null
#  booked_on                       :date            not null
#  period_from                     :date            not null
#  period_to                       :date            not null
#  validity_in_months              :integer(4)      not null
#  currency                        :string(255)     not null
#  amount                          :integer         not null
#  balance_sheet_accrual_account   :string(255)     not null
#  profit_and_loss_accrual_account :string(255)     not null
#  type_id                         :integer(4)      not null
#  user_id                         :integer(4)      not null
#  updated_by                      :integer(4)      not null
#  created_at                      :datetime        not null
#  updated_at                      :datetime        not null
#

class Invoice < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :name, :account, :counterparty, :amount, :booked_on, :currency
  validates_uniqueness_of :identification  
  validates_numericality_of :amount
  validates_format_of :counterparty, :with => /[0-9]{7}\z/,
                      :message => '- You have to enter the counterparty id in the correct Olympic format 1234567 (7 digits)'
  validates_format_of :balance_sheet_accrual_account, :profit_and_loss_accrual_account,
                      :with => /[0-9]{7}\/[0-9]{3}.[0-9]{3}.[0-9]{3}\z/,
                      :message => '- You have to enter the account number in the correct Olympic format 1234567/123.123.123'

  # default_value_for :user_id, User.current

  # creates hash for nice names in view
  TYPE_NAMES = {     1 => 'Invoice to be accrued',
                     2 => 'Invoice to be depreciated',
                     3 => 'Invoice direct to P&L',
                     4 => 'Other'}

  def type_name
    TYPE_NAMES[self.type_id]
  end

  # moves hash to an array for select box
  def self.type_id_name_options
    TYPE_NAMES.to_a.sort
  end

end
