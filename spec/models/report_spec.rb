# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Report do

  let(:invalid_attributes) { { start_date: "01/01/2014", end_date: "02/02/2013", place: 1 } }

  it "Pode ser instanciado" do
    Report.new.should be_an_instance_of(Report)
  end

  it { should allow_mass_assignment_of(:start_date) }
  it { should allow_mass_assignment_of(:end_date) }
  it { should allow_mass_assignment_of(:place) }

  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }

  describe "Test with invalid dates" do

  	before do
  		place = Place.create(name: "Secretaria")
  	end

  	after do
  		Place.where(:name => "Secretaria").first.destroy
  	end

  	it "should not be valid" do
  		report = Report.new(invalid_attributes)
  		report.should_not be_valid
  	end
  end
end
