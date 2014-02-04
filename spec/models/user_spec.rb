require 'spec_helper'


describe User do

it "Pode ser instanciado" do
    User.new.should be_an_instance_of(User)
  end





#testando se os atributos podem ser atribuidos em massa(attr)
it { should allow_mass_assignment_of(:username) }
it { should allow_mass_assignment_of(:password) }
it { should allow_mass_assignment_of(:password_confirmation) }
it { should allow_mass_assignment_of(:remember_me) }
it { should allow_mass_assignment_of(:name) }



end
