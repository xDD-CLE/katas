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

        it "should return 3 from \"1,2\"" do
          expect(Adder.add("1,2")).to eq 3
        end

      end
  end
end
