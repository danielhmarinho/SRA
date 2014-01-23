require 'spec_helper'

describe "alunos/edit" do
  before(:each) do
    @aluno = assign(:aluno, stub_model(Aluno))
  end

  it "renders the edit aluno form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", aluno_path(@aluno), "post" do
    end
  end
end
