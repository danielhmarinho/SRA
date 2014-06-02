require "spec_helper"

describe GraphsController do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "/graphs/new").to route_to("graphs#new")
    end

    it "routes to #show" do
      expect(:get => "/graphs/1").to route_to("graphs#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/graphs").to route_to("graphs#create")
    end

    it "routes to #send_graph" do
      expect(:get => "/send_graph").to route_to("graphs#send_graph")
    end

  end
end
