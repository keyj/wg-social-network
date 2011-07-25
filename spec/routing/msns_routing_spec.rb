require "spec_helper"

describe MsnsController do
  describe "routing" do

    it "routes to #index" do
      get("/msns").should route_to("msns#index")
    end

    it "routes to #new" do
      get("/msns/new").should route_to("msns#new")
    end

    it "routes to #show" do
      get("/msns/1").should route_to("msns#show", :id => "1")
    end

    it "routes to #edit" do
      get("/msns/1/edit").should route_to("msns#edit", :id => "1")
    end

    it "routes to #create" do
      post("/msns").should route_to("msns#create")
    end

    it "routes to #update" do
      put("/msns/1").should route_to("msns#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/msns/1").should route_to("msns#destroy", :id => "1")
    end

  end
end
