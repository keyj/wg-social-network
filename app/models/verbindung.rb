class Verbindung < ActiveRecord::Base
	belongs_to :rechnung
	belongs_to :msn, :foreign_key => 'msn_id', :primary_key => "msn_id"

	after_create :parse_from_raw
	

	def parse_from_raw
		self.betrag = betrag_raw.gsub(/,/,".").to_d
		save
	end
end
