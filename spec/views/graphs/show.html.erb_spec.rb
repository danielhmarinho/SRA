require 'spec_helper'

describe "graphs/show" do
  before(:each) do
    @graph = assign(:graph, stub_model(Graph,
      :date => "Date",
      :place => "Place"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Date/)
    expect(rendered).to match(/Place/)
  end
end
