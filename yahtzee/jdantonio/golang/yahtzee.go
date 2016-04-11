package yahtzee

const (
	Ones = iota
	Twos
	Threes
	Fours
	Fives
	Sixes
)

func sumForNumberRule(number int, dice [5]int) int {
	sum := 0

	for _, die := range dice {
		if die == number {
			sum += number
		}
	}

	return sum
}

// Score does foo
func Score(rule int, dice [5]int) int {
	score := 0

	switch rule {
	case Ones:
		score = sumForNumberRule(1, dice)
	case Twos:
		score = sumForNumberRule(2, dice)
	case Threes:
		score = sumForNumberRule(3, dice)
	case Fours:
		score = sumForNumberRule(4, dice)
	case Fives:
		score = sumForNumberRule(5, dice)
	case Sixes:
		score = sumForNumberRule(6, dice)
	}

	return score
}
