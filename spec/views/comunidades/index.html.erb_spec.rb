require 'spec_helper'

describe "comunidades/index" do
  before(:each) do
    assign(:comunidades, [
      stub_model(Comunidade),
      stub_model(Comunidade)
    ])
  end

  it "renders a list of comunidades" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
