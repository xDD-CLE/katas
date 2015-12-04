class TomSwift

  def self.parse_trigrams(document)
    document
      .split(/\s+/)
      .each_cons(3)
      .each_with_object(Hash.new {|h,k| h[k] = []}) do |(a, b, c), trigrams|
        trigrams["#{a} #{b}"] << c
      end
  end

  def self.blather(trigrams, length=10)
    return "" if trigrams.empty?

    words = trigrams.keys.sample.split

    (2...length).each do |i|
      digram = "#{words[i - 2]} #{words[i - 1]}"
      possible_follow_ons = trigrams[digram]
      break unless possible_follow_ons

      words << possible_follow_ons.sample
    end

    words.join(" ")
  end
end

if __FILE__ == $0
  # running from command line
  trigrams = TomSwift.parse_trigrams(File.read(ARGV.first))
  puts TomSwift.blather(trigrams, 200)
end
