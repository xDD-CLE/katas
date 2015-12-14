require 'langston'

describe Langston do

	let(:black) { " ".colorize(background: :black) }
	let(:white) { " ".colorize(background: :white) }
	let(:north) { "\u2191".colorize(color: :red) }
	let(:south) { "\u2193".colorize(color: :red) }
	let(:east) { "\u2192".colorize(color: :red) }
	let(:west) { "\u2190".colorize(color: :red) }

	it "should print initial grid when initializing" do
		expect{Langston.with_size(3, 3)}.to output(
			black + black + black + "\n" +
			black + north + black + "\n" +
			black + black + black + "\n\n\n"
		).to_stdout
	end

	it "should print the grid for each generation" do
		lang = Langston.with_size(3, 3)
		expect{lang.run(2)}.to output(
		black + black + black + "\n" +
			black + white + east + "\n" +
			black + black + black + "\n\n\n" +

			black + black + black + "\n" +
			black + white + white + "\n" +
			black + black + south + "\n\n\n"
		).to_stdout
	end
end
