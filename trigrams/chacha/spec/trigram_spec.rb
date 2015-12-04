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

    it "does not return quotations" do
      simpleString = "you say, \"don't fly too high\""
      @trigram.build(simpleString)
      results = @trigram.ask("fly too")
      expect(results).to eq(["high"])
    end

    it "does return apostrophes in the middle of a word" do
      simpleString = "Oh I can't jump over the moon"
      @trigram.build(simpleString)
      results = @trigram.ask("Oh I")
      expect(results).to eq(["can't"])
    end

    it "does not return apostrophes at the end or beginning of a word" do
      simpleString = "Brought to you by the letter 'A'"
      @trigram.build(simpleString)
      results = @trigram.ask("the letter")
      expect(results).to eq(["A"])
    end

    it "does not return periods" do
      simpleString = "My name is Harold."
      @trigram.build(simpleString)
      results = @trigram.ask("name is")
      expect(results).to eq(["Harold"])
    end

    it "does not return exclamation marks" do
      simpleString = "Don't overcook the turkey!"
      @trigram.build(simpleString)
      results = @trigram.ask("overcook the")
      expect(results).to eq(["turkey"])
    end

    it "does not return question marks" do
      simpleString = "Wouldn't you say?"
      @trigram.build(simpleString)
      results = @trigram.ask("Wouldn't you")
      expect(results).to eq(["say"])
    end

    it "does not return parenthesis" do
      simpleString = "I really like that (cute) dog"
      @trigram.build(simpleString)
      results = @trigram.ask("like that")
      expect(results).to eq(["cute"])
    end

    it "does not return underscore" do
      simpleString = "this is a _file"
      @trigram.build(simpleString)
      results = @trigram.ask("is a")
      expect(results).to eq(["file"])
    end

    it "does not return hyphen" do
      simpleString = "friend, it isn't like -that"
      @trigram.build(simpleString)
      results = @trigram.ask("isn't like")
      expect(results).to eq(["that"])
    end
  
  end

end

