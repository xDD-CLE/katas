require 'text_rearranger'

describe "TextRearranger" do
	context "when I trigramerate some text" do
		it "should be rearranged" do
			trigramerator = double('Trigramerator', trigramerate: {
				"I wish" => ["I", "I"],
				"wish I" => ["may", "might"],
				"may I"  => ["wish"],
				"I may"  => ["I"]
			})

			rearranger = TextRearranger.new(trigramerator)

			# I don't know how to test this so I'll just print it.
			text =  rearranger.rearrange
			puts text
			expect(text).to_not be_empty
		end
	end
end
