require 'spec_helper'

describe "Reports" do
  describe "GET /reports" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get reports_path
      expect(response.status).to be(302)
    end
  end
end
