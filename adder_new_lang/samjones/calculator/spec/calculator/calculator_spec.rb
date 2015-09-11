require 'calculator/string_calculator'
require 'tokenizer/tokenizer'

def tokenizer(test)
  tokenizer = instance_double('Tokenizer')
  allow(tokenizer).to receive(:ints) { test[:ints] }
  expect(tokenizer).to receive(:ints).with(test[:string])
  tokenizer
end

describe 'StringCalculator' do

  it 'should have a default value' do
    expect(StringCalculator.new.value).to eq(0)
    expect(StringCalculator.new(0).value).to eq(0)
    expect(StringCalculator.new(10).value).to eq(10)
  end

  context 'add' do
    it 'should add' do
      [{
           :initial_value => 0,
           :string => '10',
           :ints => [10],
           :result => 10
       },
       {
           :initial_value => 10,
           :string => '10',
           :ints => [10],
           :result => 20
       },
       {
           :initial_value => 10,
           :string => '0',
           :ints => [0],
           :result => 10
       }
      ].each { |test|
        expect(StringCalculator.new(test[:initial_value], tokenizer(test)).add(test[:string]).value).to eq(test[:result])
      }
    end

    it 'should add with no negatives when checking for negatives' do
      [{
           :initial_value => 0,
           :string => '10',
           :ints => [10],
           :result => 10
       }
      ].each { |test|
        expect(StringCalculator.new(test[:initial_value], tokenizer(test)).add(test[:string]).check_negatives.value).to eq(test[:result])
      }
    end

    it 'should not add with negatives when checking for negatives' do
      [{
           :initial_value => 0,
           :string => '-10',
           :ints => [-10],
           :result => 10
       }
      ].each { |test|
        expect { StringCalculator.new(test[:initial_value], tokenizer(test)).add(test[:string]).check_negatives }.to raise_error('Negatives not allowed! -10')
      }
    end
  end

  context 'subtract' do
    it 'should subtract' do
      [{
           :initial_value => 0,
           :string => '10',
           :ints => [10],
           :result => -10
       },
       {
           :initial_value => 10,
           :string => '10',
           :ints => [10],
           :result => 0
       }
      ].each { |test|
        expect(StringCalculator.new(test[:initial_value], tokenizer(test)).subtract(test[:string]).value).to eq(test[:result])
      }
    end

    it 'should subtract with no negatives when checking for negatives' do
      [{
           :initial_value => 0,
           :string => '10',
           :ints => [10],
           :result => -10
       }
      ].each { |test|
        expect(StringCalculator.new(test[:initial_value], tokenizer(test)).subtract(test[:string]).check_negatives.value).to eq(test[:result])
      }
    end

    it 'should not subtract with negatives when checking for negatives' do
      [{
           :initial_value => 0,
           :string => '-10',
           :ints => [-10],
           :result => 10
       }
      ].each { |test|
        expect { StringCalculator.new(test[:initial_value], tokenizer(test)).subtract(test[:string]).check_negatives }.to raise_error('Negatives not allowed! -10')
      }
    end
  end

  it 'should do both' do
    expect(StringCalculator.new.add('10').subtract('5').add('15,10').subtract('5,2').value).to eq(23)
  end
end