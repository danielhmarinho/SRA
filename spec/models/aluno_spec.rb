require 'spec_helper'


describe Aluno do

it "Pode ser instanciado" do
    Aluno.new.should be_an_instance_of(Aluno)
  end

#nao e permitido letras no campo matricula
  it { should validate_numericality_of(:matricula) }

end
