require 'calculator/string_calculator'


describe 'StringCalculator' do

  context 'initial values' do
    it 'should have a default value' do
      expect(StringCalculator.new.value).to eq(0)
    end


    [
        {
            :initial_value => 0,
            :value => 0
        },
        {
            :initial_value => 10,
            :value => 10
        }
    ].each do |test_case|
      it 'should have a value' do
        expect(StringCalculator.new(test_case[:initial_value]).value).to eq(test_case[:value])
      end
    end
  end


  context 'sum' do
    [
        {
            :initial_value => 0,
            :string => '10,20',
            :ints => [10, 20],
            :sum => 30
        },
        {
            :initial_value => 10,
            :string => '10,20',
            :ints => [10, 20],
            :sum => 30
        },
        {
            :initial_value => 0,
            :string => '10,-20',
            :ints => [10, -20],
            :sum => -10
        },
        {
            :initial_value => 10,
            :string => '10,-20',
            :ints => [10, -20],
            :sum => -10
        }
    ].each do |test_case|
      it 'should sum ints' do
        calculator = StringCalculator.new(test_case[:initial_value])
        allow(calculator).to receive(:ints).and_return(test_case[:ints])
        expect(calculator.sum_ints(test_case[:string])).to eq(test_case[:sum])
      end
    end
  end


  context 'check negatives' do
    [
        {
            :initial_value => 0,
            :string => '10,20',
            :ints => [10, 20],
            :raise => false
        },
        {
            :initial_value => 0,
            :string => '10,-20',
            :ints => [10, -20],
            :raise => true,
            :error => 'Negatives not allowed! -20'
        },
        {
            :initial_value => 0,
            :string => '10,-20,-30',
            :ints => [10, -20, -30],
            :raise => true,
            :error => 'Negatives not allowed! -20, -30'
        }
    ].each do |test_case|
      it 'should check negatives' do
        calculator = StringCalculator.new(test_case[:initial_value])
        allow(calculator).to receive(:ints).and_return(test_case[:ints])
        expect { calculator.check_negatives(test_case[:string]) }.to raise_error(test_case[:error]) if test_case[:raise]
        expect(calculator.check_negatives(test_case[:string])).to eq(calculator) unless test_case[:raise]
      end
    end
  end


  context 'add' do
    [
        {
            :initial_value => 0,
            :string => '10,20',
            :ints => [10, 20],
            :value => 30,
            :raise => false
        },
        {
            :initial_value => 10,
            :string => '10,20',
            :ints => [10, 20],
            :value => 40,
            :raise => false
        },
        {
            :initial_value => 0,
            :string => '10,20',
            :ints => [10, 20],
            :raise => true
        }
    ].each do |test_case|
      it 'should add' do
        calculator = StringCalculator.new(test_case[:initial_value])
        allow(calculator).to receive(:ints).and_return(test_case[:ints])
        allow(calculator).to receive(:check_negatives) { raise 'Error' if test_case[:raise] }
        expect { calculator.add(test_case[:string]) }.to raise_error('Error') if test_case[:raise]
        expect(calculator.add(test_case[:string]).value).to eq(test_case[:value]) unless test_case[:raise]
      end
    end
  end


  context 'subtract' do
    [
        {
            :initial_value => 0,
            :string => '10,20',
            :ints => [10, 20],
            :value => -30,
        },
        {
            :initial_value => 50,
            :string => '10,20',
            :ints => [10, 20],
            :value => 20,
        }
    ].each do |test_case|
      it 'should subtract' do
        calculator = StringCalculator.new(test_case[:initial_value])
        allow(calculator).to receive(:ints).and_return(test_case[:ints])
        expect(calculator.subtract(test_case[:string]).value).to eq(test_case[:value])
      end
    end
  end


  context 'preserve value' do
    it 'should preserve value calls' do
      calculator = StringCalculator.new(0)
      allow(calculator).to receive(:ints).and_return([10, 20])
      expect(calculator.subtract('10,20').value).to eq(-30)
      allow(calculator).to receive(:ints).and_return([30, 40])
      expect(calculator.add('30,40').value).to eq(40)
    end
  end
end