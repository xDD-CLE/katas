require 'cell'

describe Cell do
	let(:printer) {double('printer')}
	it "Should be created with a position and a color" do
		x, y, color = 3, 2, :black
		cell = Cell.new(x, y, color, printer: printer)

		expect(printer).to receive(:print).with(x, y, color)
		cell.print
	end

	it "Should let me recolor a cell" do
		x, y, color = 3, 2, :green
		new_color = :blue

		cell = Cell.new(x, y, color, printer: printer)
		cell.stub(:next_color) {new_color}

		cell.recolor
		
		expect(printer).to receive(:print).with(x, y, new_color)
		cell.print
	end
	
	it "Should return color infor for current color" do
		x, y, color = 3, 2, :black
		color_info = {next_color: :white, turn: :right}

		cell = Cell.new(x, y, color)
		cell.stub(:color_info) {color_info}
		expect(cell.current_color).to eq(color_info)
	end
end
