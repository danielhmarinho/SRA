
require 'spec_helper'

describe Professor do

it "Pode ser instanciado" do
    Professor.new.should be_an_instance_of(Professor)
  end

#nao e permitido letras no campo matricula
it { should validate_numericality_of(:matricula) }

end