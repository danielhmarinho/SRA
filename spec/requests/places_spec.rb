require 'spec_helper'

describe "Places" do

  describe "GET /places" do
    it "works! " do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get places_path
      expect(response.status).to be(500)
    end
  end
end
