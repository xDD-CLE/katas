require 'grid_printer'

describe GridPrinter do
	it "Should let me print a grid" do
		printer = GridPrinter.open_with_size(2, 2)
		printer.print(0, 0, 'F')
		printer.print(1, 0, 'O')
		printer.print(0, 1, 'B')
		printer.print(1, 1, 'R')
		expect {printer.refresh}.to output("[[\"F\", \"O\"], [\"B\", \"R\"]]\n").to_stdout
	end
end
