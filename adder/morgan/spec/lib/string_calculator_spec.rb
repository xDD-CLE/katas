require 'spec_helper'

describe 'string calculator' do
  describe 'addition' do
      describe 'adder' do

        let(:adder){Adder.new}

        it 'should return 0 from empty string' do
          expect(adder.add("")).to eq 0
        end

        context 'should not allow negative numbers' do
          it 'should raise error' do
              expect{adder.add("1,-2")}.to raise_error(ArgumentError)
          end

          it 'should contain the negative numbers in error message' do
              expect{adder.add("1,-2,-5")}.to raise_error(ArgumentError, "Negatives not allowed: [-2,-5]")
          end
        end
        context 'should handle single addends' do
          [
            {input: "1", expected: 1},
            {input: "5", expected: 5}
          ].each do |test_case|
            it "should return #{test_case[:input]} from \"1\"" do
              expect(adder.add(test_case[:input])).to eq test_case[:expected]
            end
          end
        end

        context 'should handle multiple addends' do
          [
            {input: "1,2", expected: 3},
            {input: "5,6,8", expected: 19},
          ].each do |test_case|
            it "should return #{test_case[:input]} from \"1\"" do
              expect(adder.add(test_case[:input])).to eq test_case[:expected]
            end
          end
        end

        context 'should handle valid delimiters' do
          it 'should handle new line delimiter' do
            expect(adder.add("4\n4")).to eq 8
          end

          it 'should handle comma delimiter' do
            expect(adder.add("4,4")).to eq 8
          end
        end
        it 'should allow for delimiter to be overridden ' do
            expect(adder.add("//;\n1;2")).to eq 3
        end
      end
  end
end
