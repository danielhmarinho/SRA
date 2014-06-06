require 'spec_helper'

describe "Atendimentos" do

  describe "GET /atendimentos" do
    it "works!" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get atendimentos_path
      expect(response.status).to be(500)
    end
  end
end
