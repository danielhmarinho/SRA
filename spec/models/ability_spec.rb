# -*- encoding : utf-8 -*-
require "cancan/matchers"
require 'spec_helper'
 
 
describe "User" do
  describe "Ability" do
    subject(:ability){ Ability.new(user) }
    let(:user){ nil }
 
 
    context "when is an Student" do

      let(:user) { FactoryGirl.create(:student) }
      before { :get_ldap_name}
     it "has a valid Factory" do
        user.should be_valid
      end
 
      it "should not allow to read Places" do
        should_not be_able_to(:read, Place.new)
      end
 
      it "should not allow to read Types" do
        should_not be_able_to(:read, Type.new)
 
      end
 
      it "should not allow to read Atendimento" do
        should_not be_able_to(:read, Atendimento.new)
 
      end
 
 
      it "should not allow to create Places" do
        should_not be_able_to(:create, Place.new)
 
      end
 
      it "should not allow to create Type" do
        should_not be_able_to(:create, Type.new)
 
      end
 
      
      it "should allow to create Atendimento" do
        should be_able_to(:create, Atendimento.new)
 
      end
 
 
      it "should not allow to update Place" do
        should_not be_able_to(:update, Place.new)
 
      end
 
      it "should not allow to update Type" do
        should_not be_able_to(:update, Type.new)
 
      end
 
      
      it "should not allow to update Atendimento" do
        should_not be_able_to(:update, Atendimento.new)
 
      end
      it "should not allow to delete Place" do
        should_not be_able_to(:delete, Place.new)
 
      end
 
      it "should not allow to delete Type" do
        should_not be_able_to(:delete, Type.new)
 
      end
 
      
      it "should not allow to delete Atendimento" do
        should_not be_able_to(:delete, Atendimento.new)
 
      end
 
      it "should not allow to edit Place" do
        should_not be_able_to(:edit, Place.new)
 
      end
 
      it "should not allow to edit Type" do
        should_not be_able_to(:edit, Type.new)
 
      end
 
      
      it "should not allow to edit Atendimento" do
        should_not be_able_to(:edit, Atendimento.new)
 
      end
 
 
    end #depois daqui




    context "when is an Professor" do

      let(:user) { FactoryGirl.create(:professor) }
      before { :get_ldap_name}
      it "has a valid Factory" do
        user.should be_valid
      end

      it "should not allow to read Places" do
        should_not be_able_to(:read, Place.new)
      end

      it "should not allow to read Types" do
        should_not be_able_to(:read, Type.new)

      end

      it "should not allow to read Atendimento" do
        should_not be_able_to(:read, Atendimento.new)

      end


      it "should not allow to create Places" do
        should_not be_able_to(:create, Place.new)

      end

      it "should not allow to create Type" do
        should_not be_able_to(:create, Type.new)

      end


      it "should allow to create Atendimento" do
        should be_able_to(:create, Atendimento.new)

      end


      it "should not allow to update Place" do
        should_not be_able_to(:update, Place.new)

      end

      it "should not allow to update Type" do
        should_not be_able_to(:update, Type.new)

      end


      it "should not allow to update Atendimento" do
        should_not be_able_to(:update, Atendimento.new)

      end
      it "should not allow to delete Place" do
        should_not be_able_to(:delete, Place.new)

      end

      it "should not allow to delete Type" do
        should_not be_able_to(:delete, Type.new)

      end


      it "should not allow to delete Atendimento" do
        should_not be_able_to(:delete, Atendimento.new)

      end

      it "should not allow to edit Place" do
        should_not be_able_to(:edit, Place.new)

      end

      it "should not allow to edit Type" do
        should_not be_able_to(:edit, Type.new)

      end


      it "should not allow to edit Atendimento" do
        should_not be_able_to(:edit, Atendimento.new)

      end


    end #depois daqui

    context "when is an Administrative" do

      let(:user) { FactoryGirl.create(:administrative) }
      before { :get_ldap_name}
      it "has a valid Factory" do
        user.should be_valid
      end

      it "should not allow to read Places" do
        should_not be_able_to(:read, Place.new)
      end

      it "should not allow to read Types" do
        should_not be_able_to(:read, Type.new)

      end

      it "should not allow to read Atendimento" do
        should_not be_able_to(:read, Atendimento.new)

      end


      it "should not allow to create Places" do
        should_not be_able_to(:create, Place.new)

      end

      it "should not allow to create Type" do
        should_not be_able_to(:create, Type.new)

      end


      it "should allow to create Atendimento" do
        should be_able_to(:create, Atendimento.new)

      end


      it "should not allow to update Place" do
        should_not be_able_to(:update, Place.new)

      end

      it "should not allow to update Type" do
        should_not be_able_to(:update, Type.new)

      end


      it "should not allow to update Atendimento" do
        should_not be_able_to(:update, Atendimento.new)

      end
      it "should not allow to delete Place" do
        should_not be_able_to(:delete, Place.new)

      end

      it "should not allow to delete Type" do
        should_not be_able_to(:delete, Type.new)

      end


      it "should not allow to delete Atendimento" do
        should_not be_able_to(:delete, Atendimento.new)

      end

      it "should not allow to edit Place" do
        should_not be_able_to(:edit, Place.new)

      end

      it "should not allow to edit Type" do
        should_not be_able_to(:edit, Type.new)

      end


      it "should not allow to edit Atendimento" do
        should_not be_able_to(:edit, Atendimento.new)

      end


    end #depois daqui

    context "when is an Admin" do

      let(:user) { FactoryGirl.create(:administrator) }
      before { :get_ldap_name}
      it "has a valid Factory" do
        user.should be_valid
      end

      it "should not allow to read Places" do
        should be_able_to(:read, Place.new)
      end

      it "should not allow to read Types" do
        should be_able_to(:read, Type.new)

      end

      it "should not allow to read Atendimento" do
        should be_able_to(:read, Atendimento.new)

      end


      it "should not allow to create Places" do
        should be_able_to(:create, Place.new)

      end

      it "should not allow to create Type" do
        should be_able_to(:create, Type.new)

      end


      it "should allow to create Atendimento" do
        should be_able_to(:create, Atendimento.new)

      end


      it "should not allow to update Place" do
        should be_able_to(:update, Place.new)

      end

      it "should not allow to update Type" do
        should be_able_to(:update, Type.new)

      end


      it "should not allow to update Atendimento" do
        should be_able_to(:update, Atendimento.new)

      end
      it "should not allow to delete Place" do
        should be_able_to(:delete, Place.new)

      end

      it "should not allow to delete Type" do
        should be_able_to(:delete, Type.new)

      end


      it "should not allow to delete Atendimento" do
        should be_able_to(:delete, Atendimento.new)

      end

      it "should not allow to edit Place" do
        should be_able_to(:edit, Place.new)

      end

      it "should not allow to edit Type" do
        should be_able_to(:edit, Type.new)

      end


      it "should not allow to edit Atendimento" do
        should be_able_to(:edit, Atendimento.new)

      end


    end #depois daqui


    context "when is an Manager" do

      let(:user) { FactoryGirl.create(:manager) }
      before { :get_ldap_name}
      it "has a valid Factory" do
        user.should be_valid
      end

      it "should not allow to read Places" do
        should be_able_to(:read, Place.new)
      end

      it "should not allow to read Types" do
        should be_able_to(:read, Type.new)

      end

      it "should not allow to read Atendimento" do
        should be_able_to(:read, Atendimento.new)

      end


      it "should not allow to create Places" do
        should be_able_to(:create, Place.new)

      end

      it "should not allow to create Type" do
        should be_able_to(:create, Type.new)

      end


      it "should allow to create Atendimento" do
        should be_able_to(:create, Atendimento.new)

      end


      it "should not allow to update Place" do
        should be_able_to(:update, Place.new)

      end

      it "should not allow to update Type" do
        should be_able_to(:update, Type.new)

      end


      it "should not allow to update Atendimento" do
        should be_able_to(:update, Atendimento.new)

      end
      it "should not allow to delete Place" do
        should_not be_able_to(:delete, Place.new)

      end

      it "should not allow to delete Type" do
        should_not be_able_to(:delete, Type.new)

      end


      it "should not allow to delete Atendimento" do
        should_not be_able_to(:delete, Atendimento.new)

      end

      it "should not allow to edit Place" do
        should be_able_to(:edit, Place.new)

      end

      it "should not allow to edit Type" do
        should be_able_to(:edit, Type.new)

      end


      it "should not allow to edit Atendimento" do
        should be_able_to(:edit, Atendimento.new)

      end


    end #depois daqui

    context "when is an External User" do

      let(:user) { FactoryGirl.create(:external_user) }
      before { :get_ldap_name}
     it "has a valid Factory" do
        user.should be_valid
      end
 
      it "should not allow to read Places" do
        should_not be_able_to(:read, Place.new)
      end
 
      it "should not allow to read Types" do
        should_not be_able_to(:read, Type.new)
 
      end
 
      it "should not allow to read Atendimento" do
        should_not be_able_to(:read, Atendimento.new)
 
      end
 
 
      it "should not allow to create Places" do
        should_not be_able_to(:create, Place.new)
 
      end
 
      it "should not allow to create Type" do
        should_not be_able_to(:create, Type.new)
 
      end
 
      
      it "should allow to create Atendimento" do
        should be_able_to(:create, Atendimento.new)
 
      end
 
 
      it "should not allow to update Place" do
        should_not be_able_to(:update, Place.new)
 
      end
 
      it "should not allow to update Type" do
        should_not be_able_to(:update, Type.new)
 
      end
 
      
      it "should not allow to update Atendimento" do
        should_not be_able_to(:update, Atendimento.new)
 
      end
      it "should not allow to delete Place" do
        should_not be_able_to(:delete, Place.new)
 
      end
 
      it "should not allow to delete Type" do
        should_not be_able_to(:delete, Type.new)
 
      end
 
      
      it "should not allow to delete Atendimento" do
        should_not be_able_to(:delete, Atendimento.new)
 
      end
 
      it "should not allow to edit Place" do
        should_not be_able_to(:edit, Place.new)
 
      end
 
      it "should not allow to edit Type" do
        should_not be_able_to(:edit, Type.new)
 
      end
 
      
      it "should not allow to edit Atendimento" do
        should_not be_able_to(:edit, Atendimento.new)
 
      end
 
 
    end #depois daqui






  end
end