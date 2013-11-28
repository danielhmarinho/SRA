require 'spec_helper'

describe "servidors/edit" do
  before(:each) do
    @servidor = assign(:servidor, stub_model(Servidor))
  end

  it "renders the edit servidor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", servidor_path(@servidor), "post" do
    end
  end
end
