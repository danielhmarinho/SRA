require 'spec_helper'


describe Place do

it "Pode ser instanciado" do
    Place.new.should be_an_instance_of(Place)
  end



#teste place deve possuir um nome
  it { should validate_presence_of(:name) }

#testando se os atributos podem ser atribuidos em massa(attr)
it { should allow_mass_assignment_of(:name) }

#validacao do campo nome
 it do
    should_not allow_value('@#$%*!>:{}+').for(:name)
  end


end
