class Abrechnung < ActiveRecord::Base
	belongs_to :rechnung
	belongs_to :user
end
