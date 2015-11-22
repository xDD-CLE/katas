require 'rspec'
require 'spec_helper'
require_relative '../trigram.rb'

describe Trigram do
	before(:each) do
    @trigram = Trigram.new
  end
  let(:string) { "I wish I may I wish I might" }

  describe "parsing" do
  	
  	it "correctly parses input string into correct hash" do
  		simpleString = "I wish I"
  		results = @trigram.parse(simpleString)
  		expect(results.size).to eq(8)
  	end



  end

end