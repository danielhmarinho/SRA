require 'spec_helper'

describe "Graphs" do
  describe "GET /graphs" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get graphs_path_new
      expect(response.status).to be(300)
    end
  end
end
