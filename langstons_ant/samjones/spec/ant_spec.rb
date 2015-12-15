require 'ant'

describe Ant do
	let(:printer) {double('printer')}
	context "Creating an Ant" do
		it "Should let me define the position and default the direction to north" do
			x, y = 2, 3
			ant = Ant.new(x, y, printer: printer)

			expect(printer).to receive(:print).with(x, y, :north)
			ant.print
		end

		it "Should let me define the position and the direction" do
			x, y, direction = 2, 3, :south
			ant = Ant.new(x, y, facing: direction, printer: printer)

			expect(printer).to receive(:print).with(x, y, direction)
			ant.print
		end
	end

	context "Turning" do
		[
			{
				start_facing: :north,
				turn: :right,
				finish_facing: :east
			},
			{
				start_facing: :east,
				turn: :right,
				finish_facing: :south
			},
			{
				start_facing: :south,
				turn: :right,
				finish_facing: :west
			},
			{
				start_facing: :west,
				turn: :right,
				finish_facing: :north
			},
			{
				start_facing: :north,
				turn: :left,
				finish_facing: :west
			},
			{
				start_facing: :west,
				turn: :left,
				finish_facing: :south
			},
			{
				start_facing: :south,
				turn: :left,
				finish_facing: :east
			},
			{
				start_facing: :east,
				turn: :left,
				finish_facing: :north
			}
		].each do |test|
			it "should turn #{test[:turn]} when facing #{test[:start_facing]}" do
				x, y = 2, 3
				ant = Ant.new(x, y, facing: test[:start_facing], printer: printer)
				ant.turn! test[:turn]

				expect(printer).to receive(:print).with(x, y, test[:finish_facing])
				ant.print
			end
		end
	end

	context "Moving" do
		[
			{
				facing: :north,
				start_x: 3,
				start_y: 3,
				finish_x: 3,
				finish_y: 2
			},
			{
				facing: :south,
				start_x: 3,
				start_y: 3,
				finish_x: 3,
				finish_y: 4
			},
			{
				facing: :east,
				start_x: 3,
				start_y: 3,
				finish_x: 4,
				finish_y: 3
			},
			{
				facing: :west,
				start_x: 3,
				start_y: 3,
				finish_x: 2,
				finish_y: 3
			},
		].each do |test|
				it "Should move one grid position #{test[:facing]}" do
					ant = Ant.new(test[:start_x], test[:start_y], facing: test[:facing], printer: printer)
					ant.move!

					expect(printer).to receive(:print).with(test[:finish_x], test[:finish_y], test[:facing])
					ant.print
				end
			end
	end
end
