require 'spec_helper'

describe Servidor do

it "Pode ser instanciado" do
    Servidor.new.should be_an_instance_of(Servidor)
  end

#nao e permitido letras no campo matricula
it { should validate_numericality_of(:matricula).is_greater_than(0) }



#testando se os atributos podem ser atribuidos em massa(attr)
it { should allow_mass_assignment_of(:matricula) }

#teste se a matricula deve ser unica

it { should validate_uniqueness_of(:matricula) }

#teste se professor extende pessoa

it { should have_one(:pessoa) }


end