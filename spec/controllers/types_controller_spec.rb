# -*- encoding : utf-8 -*-
require 'spec_helper'

describe TypesController do

  login_admin

  let(:valid_attributes) { { :name => "Tipo do atendimento" } }

  let(:valid_session) {  }

  describe "GET index" do
    it "assigns all types as @types" do
      type = Type.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:types)).to eq([type])
    end
  end

  describe "GET new" do
    it "assigns a new type as @type" do
      get :new, {}, valid_session
      expect(assigns(:type)).to be_a_new(Type)
    end
  end

  describe "GET edit" do
    it "assigns the requested type as @type" do
      type = Type.create! valid_attributes
      get :edit, {:id => type.to_param}, valid_session
      expect(assigns(:type)).to eq(type)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Type" do
        expect {
          post :create, {:type => valid_attributes}, valid_session
        }.to change(Type, :count).by(1)
      end

      it "assigns a newly created type as @type" do
        post :create, {:type => valid_attributes}, valid_session
        expect(assigns(:type)).to be_a(Type)
        expect(assigns(:type)).to be_persisted
      end

      it "redirects to the created type" do
        post :create, {:type => valid_attributes}, valid_session
        expect(response).to redirect_to(types_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved type as @type" do
        # Trigger the behavior that occurs when invalid params are submitted
        Type.any_instance.stub(:save).and_return(false)
        post :create, {:type => {  }}, valid_session
        expect(assigns(:type)).to be_a_new(Type)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Type.any_instance.stub(:save).and_return(false)
        post :create, {:type => {  }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested type" do
        type = Type.create! valid_attributes
        # Assuming there are no other types in the database, this
        # specifies that the Type created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(Type).to receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => type.to_param, :type => { "these" => "params" }}, valid_session
      end

      it "assigns the requested type as @type" do
        type = Type.create! valid_attributes
        put :update, {:id => type.to_param, :type => valid_attributes}, valid_session
        expect(assigns(:type)).to eq(type)
      end

      it "redirects to the type" do
        type = Type.create! valid_attributes
        put :update, {:id => type.to_param, :type => valid_attributes}, valid_session
        expect(response).to redirect_to(types_url)
      end
    end

    describe "with invalid params" do
      it "assigns the type as @type" do
        type = Type.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Type.any_instance.stub(:save).and_return(false)
        put :update, {:id => type.to_param, :type => {  }}, valid_session
        expect(assigns(:type)).to eq(type)
      end

      it "re-renders the 'edit' template" do
        type = Type.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Type.any_instance.stub(:save).and_return(false)
        put :update, {:id => type.to_param, :type => {  }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested type" do
      type = Type.create! valid_attributes
      expect {
        delete :destroy, {:id => type.to_param}, valid_session
      }.to change(Type, :count).by(-1)
    end

    it "redirects to the types list" do
      type = Type.create! valid_attributes
      delete :destroy, {:id => type.to_param}, valid_session
      expect(response).to redirect_to(types_url)
    end
  end

end
