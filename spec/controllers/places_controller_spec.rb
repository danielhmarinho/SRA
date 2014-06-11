# -*- encoding : utf-8 -*-
require 'spec_helper'

describe PlacesController do

  login_admin

  # This should return the minimal set of attributes required to create a valid
  # Place. As you add validations to Place, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { :name => "Biblioteca", :type_ids => [Type.create(:name => "Outros").id] } }

  describe "GET index" do
    it "assigns all places as @places" do
      place = Place.create! valid_attributes
      get :index, {}
      expect(assigns(:places)).to eq([place])
    end
  end

  describe "GET new" do
    it "assigns a new place as @place" do
      get :new, {}
      expect(assigns(:place)).to be_a_new(Place)
    end
  end

  describe "GET edit" do
    it "assigns the requested place as @place" do
      place = Place.create! valid_attributes
      get :edit, {:id => place.to_param}
      expect(assigns(:place)).to eq(place)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Place" do
        expect {
          post :create, {:place => valid_attributes}
        }.to change(Place, :count).by(1)
      end

      it "assigns a newly created place as @place" do
        post :create, {:place => valid_attributes}
        expect(assigns(:place)).to be_a(Place)
        expect(assigns(:place)).to be_persisted
      end

      it "redirects to the created place" do
        post :create, {:place => valid_attributes}
        expect(response).to redirect_to(places_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved place as @place" do
        # Trigger the behavior that occurs when invalid params are submitted
        Place.any_instance.stub(:save).and_return(false)
        post :create, {:place => {  }}
        expect(assigns(:place)).to be_a_new(Place)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Place.any_instance.stub(:save).and_return(false)
        post :create, {:place => {  }}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested place" do
        place = Place.create! valid_attributes
        # Assuming there are no other places in the database, this
        # specifies that the Place created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(Place).to receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => place.to_param, :place => { "these" => "params" }}
      end

      it "assigns the requested place as @place" do
        place = Place.create! valid_attributes
        put :update, {:id => place.to_param, :place => valid_attributes}
        expect(assigns(:place)).to eq(place)
      end

      it "redirects to the place" do
        place = Place.create! valid_attributes
        put :update, {:id => place.to_param, :place => valid_attributes}
        expect(response).to redirect_to(places_path)
      end
    end

    describe "with invalid params" do
      it "assigns the place as @place" do
        place = Place.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Place.any_instance.stub(:save).and_return(false)
        put :update, {:id => place.to_param, :place => {  }}
        expect(assigns(:place)).to eq(place)
      end

      it "re-renders the 'edit' template" do
        place = Place.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Place.any_instance.stub(:save).and_return(false)
        put :update, {:id => place.to_param, :place => {  }}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "disable the requested place" do
      place = Place.create! valid_attributes
      expect {
        delete :destroy, {:id => place.to_param}
      }.to change(Place.where('active' => false), :count).by(1)
    end

    it "redirects to the places list" do
      place = Place.create! valid_attributes
      delete :destroy, {:id => place.to_param}
      expect(response).to redirect_to(places_url)
    end
  end

end
