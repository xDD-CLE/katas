require 'rspec'
require_relative 'langstons.rb'

describe 'LangstonAnt' do  

	describe "grid" do
		it "is 11x11" do
			grid = Grid.new
		
			expect(grid.get_height).to eq(11)
			expect(grid.get_width).to eq(11)
		end

		it "starts out completely white" do
			grid = Grid.new
			
			(0..11).each do |x|
				(0..11).each do |y| 
					expect(grid.get_colour(x,y)).to eq("white")
				end
			end
		end

		it "toggles a white square to black" do
			grid = Grid.new

			orig_colour = grid.get_colour(1,1)
			expect(grid.toggle(1,1)).not_to eq(orig_colour)
		end

		it "toggles a black square to white" do
			grid = Grid.new

			orig_colour = grid.get_colour(2,2)
			new_colour = grid.toggle(2,2)

			expect(grid.toggle(2,2)).to eq(orig_colour)
		end

		skip "sets a colour" do
			grid = Grid.new

			expect(grid.set_colour(3,3)).to eq("black")
		end

	end

	describe "ant" do
		
		it "has a given starting coordinate" do
		end

		it "correctly assesses the colour square it's on" do
		end

		it "turns right one space if it's on a white square" do
		end

		it "turns a white square to black square" do
		end

		it "turns left one space if it's on a black square" do
		end

		it "turns a black square to a white square" do
		end

	end

end