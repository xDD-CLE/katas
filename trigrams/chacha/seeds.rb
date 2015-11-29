require './trigram.rb'

orig_story = File.read('dracula.txt')
scrambled_story = []

@trigram = Trigram.new
@trigram.build(orig_story)


first_word = orig_story.split(' ')[0]
second_word = orig_story.split(' ')[1]

scrambled_story.push(first_word)
scrambled_story.push(second_word)

while true

	possible_third_words = @trigram.ask([first_word, second_word].join(" "))
	
	if possible_third_words == []
		break
	end

	third_word = possible_third_words.sample

	scrambled_story.push(third_word)

	first_word = second_word
	second_word = third_word

end

puts scrambled_story.join(" ")
