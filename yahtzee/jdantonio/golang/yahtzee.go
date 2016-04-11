package yahtzee

// The allowed rules
const (
	Ones = iota
	Twos
	Threes
	Fours
	Fives
	Sixes
)

type rule func(dice [5]int) int

var rules = map[int]rule{
	Ones:   func(dice [5]int) int { return sumForNumberRule(1, dice) },
	Twos:   func(dice [5]int) int { return sumForNumberRule(2, dice) },
	Threes: func(dice [5]int) int { return sumForNumberRule(3, dice) },
	Fours:  func(dice [5]int) int { return sumForNumberRule(4, dice) },
	Fives:  func(dice [5]int) int { return sumForNumberRule(5, dice) },
	Sixes:  func(dice [5]int) int { return sumForNumberRule(6, dice) },
}

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
	score := -1

	if fn, ok := rules[rule]; ok {
		score = fn(dice)
	}

	return score
}
