require 'grid_navigable'

describe GridNavigable do
	let(:grid) { Class.new.include(GridNavigable).new }

it "Should hold x position" do
		grid.x = 3
		expect(grid.x).to eq(3)
	end

	it "Should hold y position" do
		grid.y = 3
		expect(grid.y).to eq(3)
	end

	it "Should let me tell it where it is" do
		grid.at(2,3)
		expect(grid.x).to eq(2)
		expect(grid.y).to eq(3)
	end

	[
		{
			direction: :north,
			resulting_x: 3,
			resulting_y: 2
		},
		{
			direction: :south,
			resulting_x: 3,
			resulting_y: 4
		},
		{
			direction: :east,
			resulting_x: 4,
			resulting_y: 3
		},
		{
			direction: :west,
			resulting_x: 2,
			resulting_y: 3
		}
	].each do |test|
		it "Should move #{test[:direction]}" do
			grid.at(3,3)
			grid.move_direction!(test[:direction])
			expect(grid.x).to eq(test[:resulting_x])
			expect(grid.y).to eq(test[:resulting_y])
		end
	end
end
