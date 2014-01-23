require 'spec_helper'

describe "servidors/show" do
  before(:each) do
    @servidor = assign(:servidor, stub_model(Servidor))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
