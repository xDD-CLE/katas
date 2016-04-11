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
	}

	return score
}
