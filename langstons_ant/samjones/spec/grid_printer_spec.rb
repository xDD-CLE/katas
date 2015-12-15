require 'grid_printer'

describe GridPrinter do
	let(:black) { " ".colorize(background: :black) }
	let(:white) { " ".colorize(background: :white) }
	let(:north) { "\u2191".colorize(color: :red) }
	let(:south) { "\u2193".colorize(color: :red) }
	let(:east) { "\u2192".colorize(color: :red) }
	let(:west) { "\u2190".colorize(color: :red) }

	it "Should have a size" do
		x, y = 3, 2
		printer = GridPrinter.open_with_size(x, y)

		expect(printer.width).to eq(x)
		expect(printer.height).to eq(y)
	end

	it "Should let me print a grid" do
		printer = GridPrinter.open_with_size(3, 2)
		printer.print(0, 0, :black)
		printer.print(1, 0, :white)
		printer.print(2, 0, :north)
		printer.print(0, 1, :south)
		printer.print(1, 1, :east)
		printer.print(2, 1, :west)
		expect {printer.refresh}.to output(
			black + white + north + "\n" +
			south + east + west + "\n\n\n"
		).to_stdout
	end
end
