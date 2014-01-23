require 'spec_helper'

describe "alunos/index" do
  before(:each) do
    assign(:alunos, [
      stub_model(Aluno),
      stub_model(Aluno)
    ])
  end

  it "renders a list of alunos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
