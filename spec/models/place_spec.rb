require 'spec_helper'


describe Place do

it "Pode ser instanciado" do
    Place.new.should be_an_instance_of(Place)
  end



#teste place deve possuir um nome
  it { should validate_presence_of(:name) }

#testando se os atributos podem ser atribuidos em massa(attr)
it { should allow_mass_assignment_of(:name) }
it { should allow_mass_assignment_of(:type_ids) }
it { should have_many(:atendimentos) }
it { should have_and_belong_to_many(:types) }

end
