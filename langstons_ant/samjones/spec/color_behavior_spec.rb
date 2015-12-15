require 'color_behavior'

describe ColorBehavior do
	let(:behavior) {Class.new.include(ColorBehavior).new}

	[
		{
			color: :white,
			next_color: :green
		},
		{
			color: :green,
			next_color: :blue
		},
		{
			color: :blue,
			next_color: :black
		},
		{
			color: :black,
			next_color: :white
		}
	].each do |test|
		it "Should tell me #{test[:color]} comes after #{test[:next_color]}" do
			expect(behavior.next_color(test[:color])).to eq(test[:next_color])
		end
	end

	[
		{
			color: :black,
			turn: :right
		},
		{
			color: :white,
			turn: :left
		},
		{
			color: :green,
			turn: :left
		},
		{
			color: :blue,
			turn: :right
		}
	].each do |test|
		it "Should tell me #{test[:color]} turns #{test[:turn]}" do
			expect(behavior.turn_for_color(test[:color])).to eq(test[:turn])
		end
	end
end
