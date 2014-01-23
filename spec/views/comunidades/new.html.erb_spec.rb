require 'spec_helper'

describe "comunidades/new" do
  before(:each) do
    assign(:comunidade, stub_model(Comunidade).as_new_record)
  end

  it "renders new comunidade form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comunidades_path, "post" do
    end
  end
end
