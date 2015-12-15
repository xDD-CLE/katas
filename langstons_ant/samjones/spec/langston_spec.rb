require 'langston'
require 'grid_printer'

describe Langston do
	let(:black) { " ".colorize(background: :black) }
	let(:white) { " ".colorize(background: :white) }
	let(:north) { "\u2191".colorize(color: :red) }
	let(:south) { "\u2193".colorize(color: :red) }
	let(:east) { "\u2192".colorize(color: :red) }
	let(:west) { "\u2190".colorize(color: :red) }

	before(:each) do
		@printer = GridPrinter.open_with_size(3, 3)
		@output = ""
		@printer.stub(:puts) do |val|
		 	@output << (val || "\n")
		end

	end

	it "should print initial grid when initializing" do
		Langston.new(@printer)
		expect(@output).to eq(
			black + black + black + "\n" +
			black + north + black + "\n" +
			black + black + black + "\n\n\n"
		)
	end

	it "should print the grid for each generation" do
		lang = Langston.new(@printer)
		@output = ""
		lang.run(2)
		expect(@output).to eq(
		black + black + black + "\n" +
			black + white + east + "\n" +
			black + black + black + "\n\n\n" +

			black + black + black + "\n" +
			black + white + white + "\n" +
			black + black + south + "\n\n\n"
		)
	end
end
