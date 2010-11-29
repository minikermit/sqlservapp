class B2TaMapping < ActiveRecord::Base
	set_table_name "b2_ta_mapping"
	# named_scope :recent, {:limit => 30, :order => 'created_at desc'}
	scope :recent, lambda { {:limit => 30, :conditions => ['created_at > ?', 8.weeks.ago] } }
	scope :currency, lambda { {:limit => 30, :conditions => ['information_mapped = ?', 'Currency'] } }
	scope :country, lambda { {:limit => 30, :conditions => ['information_mapped = ?', 'Country'] } }
	scope :otc, lambda { {:limit => 30, :conditions => ['information_mapped = ?', 'OTC'] } }
	scope :eeacountry, lambda { {:limit => 30, :conditions => ['information_mapped = ?', 'EEACountry'] } }
	scope :cashloanbook, lambda { {:limit => 30, :conditions => ['information_mapped = ?', 'CashLoanBook'] } }
	scope :hoglcode, lambda { {:limit => 30, :conditions => ['information_mapped = ?', 'HOGLCode'] } }
	scope :provisions, lambda { {:limit => 30, :conditions => ['information_mapped = ?', 'Provisions'] } }
	scope :countsegment, lambda { {:limit => 30, :conditions => ['information_mapped = ?', 'Count_Segment'] } }
	scope :countsegmentdet, lambda { {:limit => 30, :conditions => ['information_mapped = ?', 'Count_Segment_Det'] } }
	scope :oecdcountry, lambda { {:limit => 30, :conditions => ['information_mapped = ?', 'OECDCountry'] } }
	scope :bankid, lambda { {:limit => 30, :conditions => ['information_mapped = ?', 'Bank_ID'] } }
	scope :loanbook, lambda { {:limit => 30, :conditions => ['information_mapped = ?', 'LoanBook'] } }
	scope :informationmapped, lambda { |*args| { :conditions => ["information_mapped = ?", (args.first || 'OECDCountry') ] } }
	scope :valid, :conditions => { :record_validity => true }

	validates_presence_of :group_id, :entity_id, :information_mapped, :source_code
	validates_inclusion_of :group_id, :in => %( Hapoalim Switzerland Ltd. ), :message => "Group Identifier is not correct !"
	validates_inclusion_of :entity_id, :in => %( Zurich Singapore Luxembourg ), :message => "Entity Identifier is not correct !"
				
end
