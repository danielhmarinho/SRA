require "spec_helper"

describe ReportsController do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "/reports/new").to route_to("reports#new")
    end

    it "routes to #create" do
      expect(:post => "/reports").to route_to("reports#create")
    end

  end
end
