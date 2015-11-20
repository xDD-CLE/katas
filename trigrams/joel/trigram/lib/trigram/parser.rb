module Trigram
  class Parser
    attr_accessor :sequences

    def initialize
      @sequences = {}
    end

    def feed(some_text)
      @sequences[:foo] = some_text
    end
  end
end
