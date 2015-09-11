# Calculator

Calculator written for the [String Calculator Kata](http://osherove.com/tdd-kata-1/.)

## Installation

Add this line to your application's Gemfile:

    gem 'samjones-calculator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install calculator

## Usage

### Instantiation
New Calculator with starting value of zero
`StringCalculator.new`

New Calculator setting starting value
`StringCalculator.new(10)`

### Adding and Subtracting

Add value
`StringCalculator.new(22).add('20').value` will produce a result of 42

Subtract value
`StringCalculator.new(62).subtract('20').value` will produce a result of 42

Chaining calls
`StringCalculator.new(22).add('40').subtract('20').value` will produce a result of 42

### Working with Delimiters

Add values with default delimiters `','`, `'\n'`
`StringCalculator.new.add('12,23\n7').value` will produce a result of 42

Add values by setting delimiter to `'~''`
`StringCalculator.new.add('//~\n21~21').value` will produce a result of 42

Add values by setting delimiters to `'~''`, `'!%'`
`StringCalculator.new.add('//[~][!%]\n20~20!%2').value` will produce a result of 42

## Contributing

Contribution is closed.
