require "spec_helper"

describe ComunidadesController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/comunidades").to route_to("comunidades#index")
    end

    it "routes to #new" do
      expect(:get => "/comunidades/new").to route_to("comunidades#new")
    end

    it "routes to #show" do
      expect(:get => "/comunidades/1").to route_to("comunidades#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/comunidades/1/edit").to route_to("comunidades#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/comunidades").to route_to("comunidades#create")
    end

    it "routes to #update" do
      expect(:put => "/comunidades/1").to route_to("comunidades#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/comunidades/1").to route_to("comunidades#destroy", :id => "1")
    end

  end
end
