require 'spec_helper'

describe 'string calculator' do
  describe 'addition' do
      describe 'adder' do
        it 'should return 0 from empty string' do
          expect(Adder.add("")).to eq 0
        end
      end
  end
end
