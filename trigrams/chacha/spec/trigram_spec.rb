require 'rspec'
require 'spec_helper'
require_relative '../trigram.rb'

describe Trigram do
	before(:each) do
    @trigram = Trigram.new
  end
  #let(:string) { "I wish I may I wish I might" }

  describe "parsing" do
 
    it "correctly returns the third word in a string" do
      simpleString = "I wish I"
      results = @trigram.parse(simpleString)
      expect(results["I wish"]).to eq("I")
    end

    
    it "correctly returns the third world in a string" do
    
      simpleString = "wish I may"
      results = @trigram.parse(simpleString)
      expect(results["wish I"]).to eq("may")
    end

    
  end

end