require 'cell'

describe Cell do
	it "should be created with a position and a color" do
		cell = Cell.at_with_color(3, 2, :black)
		expect(cell.x).to eq(3)
		expect(cell.y).to eq(2)
		expect(cell.color).to eq(:black)
	end
end
