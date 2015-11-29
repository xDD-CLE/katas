require 'rspec'
require 'spec_helper'
require_relative '../trigram.rb'

describe Trigram do
	before(:each) do
    @trigram = Trigram.new
  end
  
  describe "parsing" do
    it "correctly returns an empty array when given an empty string" do
      simpleString = ""
      @trigram.build(simpleString)
      results = @trigram.ask("") 
      expect(results).to eq([])
    end

    it "correctly returns the third word given a string" do
      simpleString = "I wish I"
      @trigram.build(simpleString)
      results = @trigram.ask("I wish")
      expect(results).to eq(["I"])
    end
    
    it "correctly returns the third word in a string" do
      simpleString = "wish I may"    
      @trigram.build(simpleString)
      results = @trigram.ask("wish I")
      expect(results).to eq(["may"])
    end

    it "correctly returns the third word in a string" do
      #array1 = ["I", "wish", "I"]
      #array2 = ["wish", "I", "may"]
      simpleString = "I wish I may"    
      @trigram.build(simpleString)
      results = @trigram.ask("I wish")
      expect(results).to eq(["I"])
    end

    it "correctly returns the next word given a two word string" do
      simpleString = "I wish I may"    
      @trigram.build(simpleString)
      results = @trigram.ask("wish I")
      expect(results).to eq(["may"])
    end
    
    it "correctly returns the possible next word from a string" do
      simpleString = "red rover send Leia over"    
      @trigram.build(simpleString)
      results = @trigram.ask("rover send")
      expect(results).to eq(["Leia"])
    end
    
    it "correctly returns the possible next word from a string" do
      simpleString = "I wish I may I wish I might"    
      @trigram.build(simpleString)
      results = @trigram.ask("wish I")
      expect(results).to eq(["may", "might"])
    end

    it "does not return duplicate values" do
      simpleString = "I wish I may I wish I might"
      @trigram.build(simpleString)
      results = @trigram.ask("I wish")
      expect(results).to eq(["I"])
    end

    it "does not return punctuation" do
      simpleString = "you say, \"don't fly too high\""
      @trigram.build(simpleString)
      results = @trigram.ask("fly too")
      expect(results).to eq(["high"])
    end
    
  end

end

