# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Report do

  let(:invalid_attributes) { { start_date: "01/01/2014", end_date: "02/02/2013", place: 1 } }


  it "Pode ser instanciado" do
    Report.new.should be_an_instance_of(Report)
  end

  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }

  describe "Test with invalid dates" do

    before do
      type = Type.create(name: "Multa")
      place = Place.create(name: "Secretaria", types: Type.where("name in ('Multa')"))
    end

    after do
      Place.where(name: "Secretaria").first.destroy
      Type.where(name: "Multa").first.destroy
    end
=begin

    it "should not be valid" do
      report = Report.new(invalid_attributes)
      report.should_not be_valid
    end
  end
=end
  end
end
