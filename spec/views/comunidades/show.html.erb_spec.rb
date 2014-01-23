require 'spec_helper'

describe "comunidades/show" do
  before(:each) do
    @comunidade = assign(:comunidade, stub_model(Comunidade))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
