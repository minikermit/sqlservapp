# == Schema Information
# Schema version: 20101121151354
#
# Table name: DIM_Source_Package
#
#  Fimis_Identifier           :integer(8)      not null, primary key
#  Source_Package_Name        :string(50)      not null
#  Source_Package_Description :string(50)      not null
#

class Package < ActiveRecord::Base
	set_table_name "DIM_Source_Package"
	set_primary_key "Fimis_Identifier"

# TODO: test for the todo function

end
