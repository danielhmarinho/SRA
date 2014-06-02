# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Graph do

  let(:invalid_attributes) { { start_date: "01/01/2014", end_date: "02/02/2013", place_id: "1" } }

  it "Pode ser instanciado" do
    Graph.new.should be_an_instance_of(Graph)
  end

  it { should allow_mass_assignment_of(:start_date) }
  it { should allow_mass_assignment_of(:end_date) }
  it { should allow_mass_assignment_of(:place_id) }

  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }

  describe "Test with invalide dates" do

    before do
      type = Type.create(:name => "Multa")
      place = Place.create(name: "Secretaria", :types => Type.where("name in ('Multa')"))
    end

    after do
      Place.where(:name => "Secretaria").first.destroy
      Type.where(:name => "Multa").first.destroy
    end

    it "should not be valid" do
      graph = Graph.new(invalid_attributes)
      graph.should_not be_valid
    end
  end
end
