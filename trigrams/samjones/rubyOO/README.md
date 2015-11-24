#Language
Ruby

##Installation
bundle install

##Tests
###Continually running
guard
###One Time
rspec

##Goals
- Abstraction
  - Rearranger uses a trigramerator.
  - Trigramerator uses a tokenizer.
  - All peices can be swapped out with different implementations and everything will still work.

1. Naive Trigramerations: String to String trigramerations.
  - String Tokenizer: splits on non word characters to return words.
  - Simple Trigramerator: Trigramerates tokens into a hash. Seeds text generation by providing random key from the hash. Returns random trigramerated value for each key. Uses HashWrapper to abstract data store implementation.
  - Text Rearranger: Adds each translation to an instance variable. Returns value when completed.
2. Complex Trigramerations: File to File trigramerations. Tested with moby dick (runs in <5 seconds).
  - File Tokenizer: Lazily reads file lines, then splits on non word characters, then flattens results to return words.
	- Persisted Trigramerator: Trigramerates tokens into a database using DBM.  Seeds text generation by random key from the database. Returns random trigramerated value for each key. Uses DBMWrapper to abstract datastore implementation.
	- File Rearranger: Writes each translation to file as it happens. Does not return rearranged text to allow large file rearrangement.

##Assumptions
- Caller doesn't mind choosing and instantiating each layer.
- Trigramerating Moby Dick each time I run my test suite is A-OK.
