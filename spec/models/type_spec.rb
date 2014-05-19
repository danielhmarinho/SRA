require 'spec_helper'

describe Type do

	it "Pode ser instanciado" do
    	Type.new.should be_an_instance_of(Type)
  	end

  	it { should validate_presence_of(:name) }
  	it { should allow_mass_assignment_of(:name) }
  	it { should have_and_belong_to_many(:places) }

  	describe "Test to_s" do
  		it " New type" do
  			type = Type.create(:name => "Tipo do atendimento")
  			type.to_s
  		end

  	end

end
