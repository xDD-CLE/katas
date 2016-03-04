# File that contains the kata tests
require './hiker'

describe "word_wrap" do
  context "the phrase input" do
    it "is not longer than the column length" do
      expect{
        string = "qwertyuiop"
        column_length = 9
        word_wrap(string, column_length)
      }.to raise_error(ArgumentError)
    end
  end
end