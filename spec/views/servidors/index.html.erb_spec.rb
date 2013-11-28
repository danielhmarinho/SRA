require 'spec_helper'

describe "servidors/index" do
  before(:each) do
    assign(:servidors, [
      stub_model(Servidor),
      stub_model(Servidor)
    ])
  end

  it "renders a list of servidors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
