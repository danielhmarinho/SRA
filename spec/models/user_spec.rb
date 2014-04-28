# -*- encoding : utf-8 -*-

require 'spec_helper'

describe User do

	let(:external_user_invalid_attributes) { { external_user: true } }
	let(:external_user_valid_attributes) { { name: "Usuário Externo", matricula: "25391659310", username: "externo", 
												password: "13123", external_user: true } }
	let(:external_user_invalid_cpf) { { name: "Usuário Externo", matricula: "123", username: "externo", 
											password: "13123", external_user: true } }
    
	it "Pode ser instanciado" do
		User.new.should be_an_instance_of(User)
	end

	#testando se os atributos podem ser atribuidos em massa(attr)
	it { should allow_mass_assignment_of(:username) }
	it { should allow_mass_assignment_of(:password) }
	it { should allow_mass_assignment_of(:password_confirmation) }
	it { should allow_mass_assignment_of(:remember_me) }
	it { should allow_mass_assignment_of(:name) }

	describe "Test external user" do

	  	it "should not be valid, invalid attributes" do
	  		user = User.new(external_user_invalid_attributes)
	  		user.should_not be_valid
	  	end

	  	it "should not be valid, invalid cpf" do
	  		user = User.new(external_user_invalid_cpf)
	  		user.should_not be_valid
	  	end

	  	it "should be valid" do
	  		user = User.new(external_user_valid_attributes)
	  		user.should be_valid
	  	end
  	end

  	describe "Test internal user" do

  		describe "stuent" do
  			let(:user) { FactoryGirl.create(:student) }
  			before { :get_ldap_name}
	    
	    	it "should be valid" do
	    		user.should be_valid
	    	end
  		end

  		describe "professor" do
  			let(:user) { FactoryGirl.create(:professor) }
  			before { :get_ldap_name}
	    
	    	it "should be valid" do
	    		user.should be_valid
	    	end
  		end

  		describe "administrative" do
  			let(:user) { FactoryGirl.create(:administrative) }
  			before { :get_ldap_name}
	    
	    	it "should be valid" do
	    		user.should be_valid
	    	end
  		end
	end

  	describe "Test with invalid attributes for internal user" do

	  	it "should not be valid" do
	  		user = User.new(external_user_invalid_attributes)
	  		user.should_not be_valid
	  	end
  	end

end
