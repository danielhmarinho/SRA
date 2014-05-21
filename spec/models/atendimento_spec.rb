require 'spec_helper'

describe Atendimento do
 
 #teste Atendimento pode ser instanciado 
  it "Pode ser instanciado" do
    Atendimento.new.should be_an_instance_of(Atendimento)
  end
  
 #testando se os atributos podem ser atribuidos em massa(attr)
  it { should allow_mass_assignment_of(:created_at) }
  it { should allow_mass_assignment_of(:user_id) }
  it { should allow_mass_assignment_of(:user) }
  it { should allow_mass_assignment_of(:place_id) }
  it { should allow_mass_assignment_of(:type_id) }

  #teste se atendimento deve possuir local e data
  it { should validate_presence_of(:place) }
  
  #teste atendimento deve pertencer a pessoa, local e tipo
  it { should belong_to(:user) }
  it { should belong_to(:place) }
  it { should belong_to(:type) } 
 
end