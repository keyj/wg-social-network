require "spec_helper"

describe WgsController do
  describe "routing" do

    it "routes to #index" do
      get("/wgs").should route_to("wgs#index")
    end

    it "routes to #new" do
      get("/wgs/new").should route_to("wgs#new")
    end

    it "routes to #show" do
      get("/wgs/1").should route_to("wgs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/wgs/1/edit").should route_to("wgs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/wgs").should route_to("wgs#create")
    end

    it "routes to #update" do
      put("/wgs/1").should route_to("wgs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/wgs/1").should route_to("wgs#destroy", :id => "1")
    end

  end
end
