# -*- encoding : utf-8 -*-
require 'spec_helper'


describe AtendimentosController do


  login_admin

  let(:valid_attributes) { { :created_at => "2014-02-19 14:08:00", :place => Place.create(:name => "Local") ,
                             :type => Type.create(:name => "Documentação") }}

  describe "GET index" do
    it "assigns all atendimentos as @atendimentos" do
      atendimento = Atendimento.create(:created_at => "2014-02-19 14:08:00" , :place => Place.create(:name => "Local") ,
                                         :type => Type.create(:name => "Documentação"))
      get :index, {}
      expect(assigns(:atendimentos)).to eq([atendimento])
    end
  end


  describe "GET new" do
    it "assigns a new atendimento as @atendimento" do
      get :new, {}
      expect(assigns(:atendimento)).to be_a_new(Atendimento)
    end
  end

  describe "GET edit" do
    it "assigns the requested atendimento as @atendimento" do
      atendimento = Atendimento.create! valid_attributes
      get :edit, {:id => atendimento.to_param}
      expect(assigns(:atendimento)).to eq(atendimento)
    end
  end

  describe "POST create" do
=begin
    describe "with valid params" do
      it "creates a new Atendimento" do
        expect {
          post :create, {:atendimento => valid_attributes}, valid_session
        }.to change(Atendimento, :count).by(1)
      end

      it "assigns a newly created atendimento as @atendimento" do
        post :create, {:atendimento => valid_attributes}, valid_session
        expect(assigns(:atendimento)).to be_a(Atendimento)
        expect(assigns(:atendimento)).to be_persisted
      end

      it "redirects to the created atendimento" do
        post :create, {:atendimento => valid_attributes}, valid_session
        expect(response).to redirect_to(atendimentos_path)
      end
    end
=end

    describe "with invalid params" do
      it "assigns a newly created but unsaved atendimento as @atendimento" do
        # Trigger the behavior that occurs when invalid params are submitted
        Atendimento.any_instance.stub(:save).and_return(false)
        post :create, {:atendimento => {  }}
        expect(assigns(:atendimento)).to be_a_new(Atendimento)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Atendimento.any_instance.stub(:save).and_return(false)
        post :create, {:atendimento => {  }}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
=begin
    describe "with valid params" do
      it "updates the requested atendimento" do
        atendimento = Atendimento.create! valid_attributes
        # Assuming there are no other atendimentos in the database, this
        # specifies that the Atendimento created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(Atendimento).to receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => atendimento.to_param, :atendimento => { "these" => "params" }}, valid_session
      end

      it "assigns the requested atendimento as @atendimento" do
        atendimento = Atendimento.create! valid_attributes
        put :update, {:id => atendimento.to_param, :atendimento => valid_attributes}, valid_session
        expect(assigns(:atendimento)).to eq(atendimento)
      end

      it "redirects to the atendimento" do
        atendimento = Atendimento.create! valid_attributes
        put :update, {:id => atendimento.to_param, :atendimento => valid_attributes}, valid_session
        expect(response).to redirect_to(atendimentos_path)
      end
    end
=end

    describe "with invalid params" do
      it "assigns the atendimento as @atendimento" do
        atendimento = Atendimento.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Atendimento.any_instance.stub(:save).and_return(false)
        put :update, {:id => atendimento.to_param, :atendimento => {  }}
        expect(assigns(:atendimento)).to eq(atendimento)
      end

      it "re-renders the 'edit' template" do
        atendimento = Atendimento.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Atendimento.any_instance.stub(:save).and_return(false)
        put :update, {:id => atendimento.to_param, :atendimento => {  }}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested atendimento" do
      atendimento = Atendimento.create! valid_attributes
      expect {
        delete :destroy, {:id => atendimento.to_param}
      }.to change(Atendimento, :count).by(-1)
    end

    it "redirects to the atendimentos list" do
      atendimento = Atendimento.create! valid_attributes
      delete :destroy, {:id => atendimento.to_param}
      expect(response).to redirect_to(atendimentos_url)
    end
  end

end
