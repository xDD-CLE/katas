require './trigram.rb'

orig_story = File.read('dracula.txt')
trigram = Trigram.new
trigram.build(orig_story)


def story_builder(orig_story, trigram)
	
	story_words = orig_story.split(' ')
	index = Random.rand(story_words.length)

	scrambled_story = []

	first_word = story_words[index]
	second_word = story_words[index+1]
	
	scrambled_story.push(first_word)
	scrambled_story.push(second_word)

	while true

		possible_third_words = trigram.ask([first_word, second_word].join(" "))
		
		if possible_third_words == []
			break
		end

		third_word = possible_third_words.sample

		scrambled_story.push(third_word)

		first_word = second_word
		second_word = third_word

	end

	puts scrambled_story.join(" ")
end

5.times do |index|
	story_builder(orig_story, trigram)
end