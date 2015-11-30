require "rspec"
require_relative "tom_swift"

RSpec.describe TomSwift do
  let(:document) { "I wish I may I wish I might" }
  let(:trigrams) {{
    "I wish" => ["I", "I"],
    "wish I" => ["may", "might"],
    "I may" => ["I"],
    "may I" => ["wish"],
  }}

  describe ".parse_trigrams" do
    it "returns an empty hash if the input has no trigrams" do
      expect(described_class.parse_trigrams("I wish")).to eq({})
    end

    it "builds a hash with one digram and one possible follow on from 3 words" do
      expect(described_class.parse_trigrams("I wish I")).to eq("I wish" => ["I"])
    end

    it "builds a hash with multiple digrams and possible follow ons" do
      expect(described_class.parse_trigrams(document)).to eq(trigrams)
    end
  end

  describe ".blather" do
    it "returns an empty string if the input has no trigrams" do
      expect(described_class.blather({})).to eq ""
    end

    it "builds phrases from trigrams" do
      expect(described_class.blather("I wish" => ["I"])).to eq "I wish I"
    end

    it "blathers aphasically with trigrams" do
      blathering = described_class.blather(trigrams)
      trigrams_from_blathering =
        blathering
          .split(" ")
          .each_cons(3)
          .each_with_object([]) do |(a, b, c), trigrams|
            trigrams << ["#{a} #{b}", c]
          end

      expect(trigrams_from_blathering).to be_all { |(digram, follow_on)|
        trigrams.fetch(digram).include?(follow_on)
      }
      puts blathering
    end
  end
end
