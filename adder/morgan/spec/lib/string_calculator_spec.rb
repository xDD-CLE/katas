require 'spec_helper'

describe 'string calculator' do
  describe 'addition' do
      describe 'adder' do
        it 'should return 0 from empty string' do
          expect(Adder.add("")).to eq 0
        end

        it 'should return 1 from "1"' do
          expect(Adder.add("1")).to eq 1
        end
      end
  end
end
