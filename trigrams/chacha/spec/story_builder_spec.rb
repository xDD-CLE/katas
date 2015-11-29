require 'rspec'
require 'spec_helper'
require_relative '../storybuilder.rb'

describe StoryBuilder do
	before(:each) do
    @trigram = Trigram.new
  end

	let(:string) {"I find that the district he named is in the
extreme east of the country, just on the borders of three states,
Transylvania, Moldavia and Bukovina, in the midst of the Carpathian
mountains; one of the wildest and least known portions of Europe. I was
not able to light on any map or work giving the exact locality of the
Castle Dracula, as there are no maps of this country as yet to compare
with our own Ordnance Survey maps; but I found that Bistritz, the post
town named by Count Dracula, is a fairly well-known place. I shall enter
here some of my notes, as they may refresh my memory when I talk over my
travels with Mina."}

	it "should return a new story given a string" do
		
	end
	

end