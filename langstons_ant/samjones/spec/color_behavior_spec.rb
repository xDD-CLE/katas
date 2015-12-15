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

	it "Should return color info" do
		expect(behavior.color_info(:black)).to eq({next_color: :white, turn: :right})
	end
end
