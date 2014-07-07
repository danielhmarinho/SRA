require 'spec_helper'

describe "Types" do

  describe "GET /types" do
    it "works!" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get types_path
      expect(response.status).to be(500)
    end
  end
end
