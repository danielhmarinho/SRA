require 'spec_helper'


describe Pessoa do

it "Pode ser instanciado" do
    Pessoa.new.should be_an_instance_of(Pessoa)
  end

#validacao do campo nome
 it do
    should_not allow_value('@#$%*!>:{}+').for(:name)
  end


#testando se os atributos podem ser atribuidos em massa(attr)
it { should allow_mass_assignment_of(:name) }

end
