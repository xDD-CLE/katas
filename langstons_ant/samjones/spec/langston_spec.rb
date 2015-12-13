require 'langston'

describe Langston do
	it "should print initial grid when initializing" do
		expect{Langston.with_size(3, 3)}.to output("[[:black, :black, :black], [:black, :north, :black], [:black, :black, :black]]\n").to_stdout
	end

	it "should print the grid for each generation" do
		lang = Langston.with_size(3, 3)
		expect{lang.run(2)}.to output("[[:black, :black, :black], [:black, :white, :east], [:black, :black, :black]]\n[[:black, :black, :black], [:black, :white, :white], [:black, :black, :south]]\n").to_stdout
	end
end
