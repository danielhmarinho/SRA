require "spec_helper"

describe ServidorsController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/servidors").to route_to("servidors#index")
    end

    it "routes to #new" do
      expect(:get => "/servidors/new").to route_to("servidors#new")
    end

    it "routes to #show" do
      expect(:get => "/servidors/1").to route_to("servidors#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/servidors/1/edit").to route_to("servidors#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/servidors").to route_to("servidors#create")
    end

    it "routes to #update" do
      expect(:put => "/servidors/1").to route_to("servidors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/servidors/1").to route_to("servidors#destroy", :id => "1")
    end

  end
end
