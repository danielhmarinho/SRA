require 'spec_helper'


describe Aluno do

it "Pode ser instanciado" do
    Aluno.new.should be_an_instance_of(Aluno)
  end

#nao e permitido letras no campo matricula
  it { should validate_numericality_of(:matricula) }



#testando se os atributos podem ser atribuidos em massa(attr)
it { should allow_mass_assignment_of(:matricula) }


#teste aluno deve extender pessoa

it { should have_one(:pessoa) } 

#teste matricula deve ser unica

it { should validate_uniqueness_of(:matricula) }


end
