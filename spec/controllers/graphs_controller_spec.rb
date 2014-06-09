# -*- encoding : utf-8 -*-
require 'spec_helper'

describe GraphsController do

  login_admin

  let(:valid_attributes) { { start_date: "01/01/2014", end_date: "02/02/2014", place_id: Place.last.id } }

  before :each do
    type = Type.create(:name => "Multa")
    place = Place.create(name: "Laboratorio", :types => Type.where("name in ('Multa')"))
    Atendimento.create(:created_at => "2014-01-05 14:08:00" , :place => place, :type => type, :user_id => User.last.id)
  end

  after :each do
    Place.where(:name => "Laboratorio").first.destroy
    Type.where(:name => "Multa").first.destroy
    Atendimento.all.each do |atendimento|
      atendimento.destroy
    end
  end

  describe "GET show" do
    it "assigns the requested graph as @graph" do
      graph = Graph.create valid_attributes
      get :show, {:id => graph.to_param}
      expect(assigns(:graph)).to eq(graph)
    end
  end

  describe "GET new" do
    it "assigns a new graph as @graph" do
      get :new, {}
      expect(assigns(:graph)).to be_a_new(Graph)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Graph" do
        expect {
          post :create, {:graph => valid_attributes}
        }.to change(Graph, :count).by(1)
      end

      it "assigns a newly created graph as @graph" do
        post :create, {:graph => valid_attributes}
        expect(assigns(:graph)).to be_a(Graph)
        expect(assigns(:graph)).to be_persisted
      end

      it "redirects to the created graph" do
        post :create, {:graph => valid_attributes}
        expect(response).to redirect_to graph_path(Graph.last.id)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved graph as @graph" do
        # Trigger the behavior that occurs when invalid params are submitted
        Graph.any_instance.stub(:save).and_return(false)
        post :create, {:graph => { }}
        expect(assigns(:graph)).to be_a_new(Graph)
      end

      it "re-renders the 'new' template" do
        #Trigger the behavior that occurs when invalid params are submitted
        Graph.any_instance.stub(:save).and_return(false)
        post :create, {:graph => {  }}
        expect(response).to redirect_to new_graph_path
      end
    end
  end

  describe "Send graphs" do
    it "should send the report to download" do
      post :send_graph, { }
      expect(response.status).to be(200)
    end
  end

end
