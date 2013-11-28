require 'spec_helper'

describe "servidors/new" do
  before(:each) do
    assign(:servidor, stub_model(Servidor).as_new_record)
  end

  it "renders new servidor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", servidors_path, "post" do
    end
  end
end
