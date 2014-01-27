require 'spec_helper'


describe Comunidade do

it "Pode ser instanciado" do
    Comunidade.new.should be_an_instance_of(Comunidade)
  end


#testando se os atributos podem ser atribuidos em massa(attr)
it { should allow_mass_assignment_of(:identificacao) }


#teste aluno deve extender pessoa

it { should have_one(:user) } 


end
