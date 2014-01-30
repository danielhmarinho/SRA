require "cancan/matchers"
require 'spec_helper'


describe "User" do
  describe "Ability" do
    subject(:ability){ Ability.new(user) }
    let(:user){ nil }

    context "when is an Aluno" do
      it "has a valid Factory" do
        FactoryGirl.create(:aluno).should be_valid
      end

      it "should not allow to read places" do
        should_not be_able_to(:read, Place.new)

      end
    end
  end
end
