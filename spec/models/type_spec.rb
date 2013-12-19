require 'spec_helper'


describe Type do

it "Pode ser instanciado" do
    Type.new.should be_an_instance_of(Type)
  end

#teste tipo de atendimento deve possuir um local de atendimento
  it { should validate_presence_of(:places) }


#teste tipo de atendimento deve possuir um nome
  it { should validate_presence_of(:name) }

#testando se os atributos podem ser atribuidos em massa(attr)
it { should allow_mass_assignment_of(:name) }



#teste type deve possuir pelo menos um local

it { should have_and_belong_to_many(:places) }

#validacao do campo nome
 it do
    should_not allow_value('@#$%*!>:{}+').for(:name)
  end


end
