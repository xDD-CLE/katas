require 'ant'

describe Ant do
	it "Should be created with position and facing a direction" do
		ant = Ant.at_and_facing(3, 2, :south)
		expect(ant.x).to eq(3)
		expect(ant.y).to eq(2)
		expect(ant.facing).to eq(:south)
	end

	context "Turning and Moving" do
		[
			{
				start_facing: :north,
				turn: :right,
				finish_facing: :east,
				finish_x: 4,
				finish_y: 3
			},
			{
				start_facing: :east,
				turn: :right,
				finish_facing: :south,
				finish_x: 3,
				finish_y: 4
			},
			{
				start_facing: :south,
				turn: :right,
				finish_facing: :west,
				finish_x: 2,
				finish_y: 3
			},
			{
				start_facing: :west,
				turn: :right,
				finish_facing: :north,
				finish_x: 3,
				finish_y: 2
			},
			{
				start_facing: :north,
				turn: :left,
				finish_facing: :west,
				finish_x: 2,
				finish_y: 3
			},
			{
				start_facing: :west,
				turn: :left,
				finish_facing: :south,
				finish_x: 3,
				finish_y: 4
			},
			{
				start_facing: :south,
				turn: :left,
				finish_facing: :east,
				finish_x: 4,
				finish_y: 3
			},
			{
				start_facing: :east,
				turn: :left,
				finish_facing: :north,
				finish_x: 3,
				finish_y: 2
			}
		].each do |test|
			it "should turn #{test[:turn]} with facing #{test[:start_facing]}" do
				ant = Ant.at_and_facing(3, 3, test[:start_facing])
				ant.turn_and_move test[:turn]
				expect(ant.facing).to eq(test[:finish_facing])
				expect(ant.x).to eq(test[:finish_x])
				expect(ant.y).to eq(test[:finish_y])
			end
		end
	end
end
