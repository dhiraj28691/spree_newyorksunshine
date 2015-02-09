require "spec_helper"

describe Spree::Admin::WorksController do
  describe "routing" do

    it "routes to #index" do
      get("/spree/admins").should route_to("spree/admins#index")
    end

    it "routes to #new" do
      get("/spree/admins/new").should route_to("spree/admins#new")
    end

    it "routes to #show" do
      get("/spree/admins/1").should route_to("spree/admins#show", :id => "1")
    end

    it "routes to #edit" do
      get("/spree/admins/1/edit").should route_to("spree/admins#edit", :id => "1")
    end

    it "routes to #create" do
      post("/spree/admins").should route_to("spree/admins#create")
    end

    it "routes to #update" do
      put("/spree/admins/1").should route_to("spree/admins#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/spree/admins/1").should route_to("spree/admins#destroy", :id => "1")
    end

  end
end
