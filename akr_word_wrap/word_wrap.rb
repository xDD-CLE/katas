# File that contains the kata logic
def word_wrap(phrase, column_length)
  if phrase.include?(' ') == false && phrase.length > column_length
    raise ArgumentError
  else
    phrase.split(' ') |sub_phrase| do
      if sub_phrase.length > column_length
        raise ArgumentError
      end
    end
  end
end