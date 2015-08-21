require 'spec_helper'

describe 'string calculator' do
  describe 'addition' do
      describe 'adder' do
        it 'should return 0 from empty string' do
          expect(Adder.add("")).to eq 0
        end

        context 'should handle single addends' do
          [
            {input: "1", expected: 1},
            {input: "5", expected: 5}
          ].each do |test_case|
            it "should return #{test_case[:input]} from \"1\"" do
              expect(Adder.add(test_case[:input])).to eq test_case[:expected]
            end
          end
        end

        context 'should handle multiple addends' do
          [
            {input: "1,2", expected: 3},
            {input: "5,6,8", expected: 19},
          ].each do |test_case|
            it "should return #{test_case[:input]} from \"1\"" do
              expect(Adder.add(test_case[:input])).to eq test_case[:expected]
            end
          end
        end

        context 'should handle valid delimiter' do
          it 'should handle new line delimiter' do
            expect(Adder.add("4\n4")).to eq 8
          end
          it 'should handle comma delimiter' do
            expect(Adder.add("4,4")).to eq 8
          end
        end
      end
  end
end
