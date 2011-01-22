# == Schema Information
# Schema version: 20101121151354
#
# Table name: fdbtabs
#
#  id                   :integer(4)      not null, primary key
#  TBID                 :string(3)       not null
#  TBCODE               :string(14)      not null
#  TBETAT               :string(1)       not null
#  TBDTOU               :string(6)       not null
#  TBDTMU               :string(6)       not null
#  TBOPRN               :string(7)       not null
#  TBDES1               :string(35)      not null
#  TBDES2               :string(35)      not null
#  TBDES3               :string(35)      not null
#  TBDES4               :string(35)      not null
#  TBCOMP               :string(73)      not null
#  TBNBRM               :integer(4)      not null
#  fimis_status         :string(1)       not null
#  Group_Identifier     :string(50)      not null
#  Entity_Identifier    :string(50)      not null
#  Source_Identifier    :string(50)      not null
#  Record_Creation_Date :datetime        not null
#  Source_Package       :string(50)      not null
#

class Fdbtab < ActiveRecord::Base
	# set_table_name "FIMIS_TA_SRC_OLY_0_Nomenclatures_FDBTAB"

#require 'comma'

# ===============
# = CSV support =
# ===============
  #comma do |fdbtab| # implicitly named :default
  #  fdbtab.id
  #  fdbtab.TBID
  #  fdbtab.TBCODE
  #end



end

