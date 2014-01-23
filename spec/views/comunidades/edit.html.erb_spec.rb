require 'spec_helper'

describe "comunidades/edit" do
  before(:each) do
    @comunidade = assign(:comunidade, stub_model(Comunidade))
  end

  it "renders the edit comunidade form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comunidade_path(@comunidade), "post" do
    end
  end
end
