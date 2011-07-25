require 'spec_helper'

describe Rechnung do
	it "should create a Rechnung" do
		rechnung = Rechnung.new
		rechnung.should_not_equal(nil)
		rechnung.rechnungsnummer.should include("32")
	end

end
