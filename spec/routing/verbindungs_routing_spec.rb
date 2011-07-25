require "spec_helper"

describe VerbindungsController do
  describe "routing" do

    it "routes to #index" do
      get("/verbindungs").should route_to("verbindungs#index")
    end

    it "routes to #new" do
      get("/verbindungs/new").should route_to("verbindungs#new")
    end

    it "routes to #show" do
      get("/verbindungs/1").should route_to("verbindungs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/verbindungs/1/edit").should route_to("verbindungs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/verbindungs").should route_to("verbindungs#create")
    end

    it "routes to #update" do
      put("/verbindungs/1").should route_to("verbindungs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/verbindungs/1").should route_to("verbindungs#destroy", :id => "1")
    end

  end
end
