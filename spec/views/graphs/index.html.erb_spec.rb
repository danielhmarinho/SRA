require 'spec_helper'

describe "graphs/index" do
  before(:each) do
    assign(:graphs, [
      stub_model(Graph,
        :date => "Date",
        :place => "Place"
      ),
      stub_model(Graph,
        :date => "Date",
        :place => "Place"
      )
    ])
  end

  it "renders a list of graphs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Date".to_s, :count => 2
    assert_select "tr>td", :text => "Place".to_s, :count => 2
  end
end
