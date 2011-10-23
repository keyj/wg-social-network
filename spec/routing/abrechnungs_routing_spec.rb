require "spec_helper"

describe AbrechnungsController do
  describe "routing" do

    it "routes to #index" do
      get("/abrechnungs").should route_to("abrechnungs#index")
    end

    it "routes to #new" do
      get("/abrechnungs/new").should route_to("abrechnungs#new")
    end

    it "routes to #show" do
      get("/abrechnungs/1").should route_to("abrechnungs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/abrechnungs/1/edit").should route_to("abrechnungs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/abrechnungs").should route_to("abrechnungs#create")
    end

    it "routes to #update" do
      put("/abrechnungs/1").should route_to("abrechnungs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/abrechnungs/1").should route_to("abrechnungs#destroy", :id => "1")
    end

  end
end
