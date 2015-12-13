require 'color_behavior'

describe ColorBehavior do
	let(:behavior) {Class.new.include(ColorBehavior).new}

	[
		{
			color: :black,
			next_color: :white
		},
		{
			color: :white,
			next_color: :black
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
		}
	].each do |test|
		it "Should tell me #{test[:color]} turns #{test[:turn]}" do
			expect(behavior.turn_for_color(test[:color])).to eq(test[:turn])
		end
	end
end
