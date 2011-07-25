class Msn < ActiveRecord::Base
	belongs_to :user
	has_many :verbindungs, :foreign_key => 'msn_id', :primary_key => 'msn_id'
end
