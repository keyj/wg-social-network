require 'spec_helper'

describe "Wgs" do
  describe "GET /wgs" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get wgs_path
      response.status.should be(200)
    end
  end
end
