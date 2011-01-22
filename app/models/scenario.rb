# == Schema Information
# Schema version: 20101121151354
#
# Table name: DIM_Scenario
#
#  Fimis_Identifier         :integer(8)      not null, primary key
#  Category_Code            :string(50)      not null
#  Category_Name            :string(100)     not null
#  Record_Creation_Date     :datetime        not null
#  Record_Creator           :string(50)      not null
#  Record_Modification_Date :datetime
#  Record_Modifier          :string(50)
#

class Scenario < ActiveRecord::Base
	set_table_name "DIM_Scenario"
	set_primary_key "Fimis_Identifier"
end
