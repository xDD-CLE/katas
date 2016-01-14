require 'chains_words'

Given(/^I start with the word (.*)$/) do |start_word|
	@start_word = start_word
end

When(/^I chain words to (.*)$/) do |end_word|
	@result = ChainsWords.new.chain_words(@start_word, end_word)
end

Then(/^I create a word chain$/) do
	expect(@result.is_a?(Array)).to eq(true)
	expect(@result.length).to be_greater_than(0)
end
