require "cancan/matchers"
require 'spec_helper'


describe "User" do
  describe "Ability" do
    subject(:ability){ Ability.new(user) }
    let(:user){ nil }

    context "when is an Aluno" do
      let(:user){ FactoryGirl.create(:aluno) }

      it "has a valid Factory" do
        user.should be_valid
      end

      it "should not allow to read Places" do
        should_not be_able_to(:read, Place.new)

      end
      it "should not allow to read Types" do
        should_not be_able_to(:read, Type.new)

      end
      it "should not allow to read Aluno" do
        should_not be_able_to(:read, Aluno.new)

      end
      it "should not allow to read Professor" do
        should_not be_able_to(:read, Professor.new)

      end
      it "should not allow to read Servidor" do
        should_not be_able_to(:read, Servidor.new)

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

      it "should not allow to create Professor" do
        should_not be_able_to(:create, Professor.new)

      end

      it "should not allow to create Aluno" do
        should_not be_able_to(:create, Aluno.new)

      end

      it "should not allow to create Servidor" do
        should_not be_able_to(:create, Servidor.new)

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

      it "should not allow to update Professor" do
        should_not be_able_to(:update, Professor.new)

      end

      it "should not allow to update Aluno" do
        should_not be_able_to(:update, Aluno.new)

      end

      it "should not allow to update Servidor" do
        should_not be_able_to(:update, Servidor.new)

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

      it "should not allow to delete Professor" do
        should_not be_able_to(:delete, Professor.new)

      end

      it "should not allow to delete Aluno" do
        should_not be_able_to(:delete, Aluno.new)

      end

      it "should not allow to delete Servidor" do
        should_not be_able_to(:delete, Servidor.new)

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

      it "should not allow to edit Professor" do
        should_not be_able_to(:edit, Professor.new)

      end

      it "should not allow to edit Aluno" do
        should_not be_able_to(:edit, Aluno.new)

      end

      it "should not allow to edit Servidor" do
        should_not be_able_to(:edit, Servidor.new)

      end

      it "should not allow to edit Atendimento" do
        should_not be_able_to(:edit, Atendimento.new)

      end


    end #depois daqui

    context "when is an Professor" do
      let(:user){ FactoryGirl.create(:professor) }

      it "has a valid Factory" do
        user.should be_valid
      end

      it "should not allow to read Places" do
        should_not be_able_to(:read, Place.new)

      end
      it "should not allow to read Types" do
        should_not be_able_to(:read, Type.new)

      end
      it "should not allow to read Aluno" do
        should_not be_able_to(:read, Aluno.new)

      end
      it "should not allow to read Professor" do
        should_not be_able_to(:read, Professor.new)

      end
      it "should not allow to read Servidor" do
        should_not be_able_to(:read, Servidor.new)

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

      it "should not allow to create Professor" do
        should_not be_able_to(:create, Professor.new)

      end

      it "should not allow to create Aluno" do
        should_not be_able_to(:create, Aluno.new)

      end

      it "should not allow to create Servidor" do
        should_not be_able_to(:create, Servidor.new)

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

      it "should not allow to update Professor" do
        should_not be_able_to(:update, Professor.new)

      end

      it "should not allow to update Aluno" do
        should_not be_able_to(:update, Aluno.new)

      end

      it "should not allow to update Servidor" do
        should_not be_able_to(:update, Servidor.new)

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

      it "should not allow to delete Professor" do
        should_not be_able_to(:delete, Professor.new)

      end

      it "should not allow to delete Aluno" do
        should_not be_able_to(:delete, Aluno.new)

      end

      it "should not allow to delete Servidor" do
        should_not be_able_to(:delete, Servidor.new)

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

      it "should not allow to edit Professor" do
        should_not be_able_to(:edit, Professor.new)

      end

      it "should not allow to edit Aluno" do
        should_not be_able_to(:edit, Aluno.new)

      end

      it "should not allow to edit Servidor" do
        should_not be_able_to(:edit, Servidor.new)

      end

      it "should not allow to edit Atendimento" do
        should_not be_able_to(:edit, Atendimento.new)

      end

    end #depois daqui

    context "when is an Aluno" do
      let(:user){ FactoryGirl.create(:servidor) }

      it "has a valid Factory" do
        user.should be_valid
      end

      it "should not allow to read Places" do
        should be_able_to(:read, Place.new)

      end
      it "should not allow to read Types" do
        should be_able_to(:read, Type.new)

      end
      it "should not allow to read Aluno" do
        should be_able_to(:read, Aluno.new)

      end
      it "should not allow to read Professor" do
        should be_able_to(:read, Professor.new)

      end
      it "should not allow to read Servidor" do
        should be_able_to(:read, Servidor.new)

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

      it "should not allow to create Professor" do
        should be_able_to(:create, Professor.new)

      end

      it "should not allow to create Aluno" do
        should be_able_to(:create, Aluno.new)

      end

      it "should not allow to create Servidor" do
        should be_able_to(:create, Servidor.new)

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

      it "should not allow to update Professor" do
        should_not be_able_to(:update, Professor.new)

      end

      it "should not allow to update Aluno" do
        should_not be_able_to(:update, Aluno.new)

      end

      it "should not allow to update Servidor" do
        should_not be_able_to(:update, Servidor.new)

      end

      it "should not allow to update Atendimento" do
        should be_able_to(:update, Atendimento.new)

      end


      it "should not allow to delete Professor" do
        should_not be_able_to(:delete, Professor.new)

      end

      it "should not allow to delete Aluno" do
        should_not be_able_to(:delete, Aluno.new)

      end

      it "should not allow to delete Servidor" do
        should_not be_able_to(:delete, Servidor.new)

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

      it "should not allow to edit Professor" do
        should_not be_able_to(:edit, Professor.new)

      end

      it "should not allow to edit Aluno" do
        should_not be_able_to(:edit, Aluno.new)

      end

      it "should not allow to edit Servidor" do
        should_not be_able_to(:edit, Servidor.new)

      end

      it "should not allow to edit Atendimento" do
        should be_able_to(:edit, Atendimento.new)

      end

    end #depois daqui

  end
end
