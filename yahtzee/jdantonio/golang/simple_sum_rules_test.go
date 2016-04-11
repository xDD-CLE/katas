package yahtzee

import (
	"testing"
)

func TestOnesRuleWithZeroOnes(t *testing.T) {
	expected := 0
	actual := Score(Ones, [5]int{2, 3, 4, 5, 6})
	if actual != expected {
		t.Errorf("expected %v got %v", expected, actual)
	}
}

func TestOnesRuleWithSomeOnes(t *testing.T) {
	expected := 3
	actual := Score(Ones, [5]int{1, 2, 1, 4, 1})
	if actual != expected {
		t.Errorf("expected %v got %v", expected, actual)
	}
}

func TestOnesRuleWithAllOnes(t *testing.T) {
	expected := 5
	actual := Score(Ones, [5]int{1, 1, 1, 1, 1})
	if actual != expected {
		t.Errorf("expected %v got %v", expected, actual)
	}
}

func TestTwosRuleWithZeroTwos(t *testing.T) {
	expected := 0
	actual := Score(Twos, [5]int{1, 3, 4, 5, 6})
	if actual != expected {
		t.Errorf("expected %v got %v", expected, actual)
	}
}

func TestTwosRuleWithSomeTwos(t *testing.T) {
	expected := 4
	actual := Score(Twos, [5]int{1, 2, 3, 4, 2})
	if actual != expected {
		t.Errorf("expected %v got %v", expected, actual)
	}
}

func TestTwosRuleWithAllTwos(t *testing.T) {
	expected := 10
	actual := Score(Twos, [5]int{2, 2, 2, 2, 2})
	if actual != expected {
		t.Errorf("expected %v got %v", expected, actual)
	}
}

func TestThreesRuleWithZeroThrees(t *testing.T) {
	expected := 0
	actual := Score(Threes, [5]int{1, 2, 4, 5, 6})
	if actual != expected {
		t.Errorf("expected %v got %v", expected, actual)
	}
}

func TestThreesRuleWithSomeThrees(t *testing.T) {
	expected := 6
	actual := Score(Threes, [5]int{1, 3, 1, 3, 1})
	if actual != expected {
		t.Errorf("expected %v got %v", expected, actual)
	}
}

func TestThreesRuleWithAllThrees(t *testing.T) {
	expected := 15
	actual := Score(Threes, [5]int{3, 3, 3, 3, 3})
	if actual != expected {
		t.Errorf("expected %v got %v", expected, actual)
	}
}

func TestFoursRuleWithZeroFours(t *testing.T) {
	expected := 0
	actual := Score(Fours, [5]int{1, 2, 3, 5, 6})
	if actual != expected {
		t.Errorf("expected %v got %v", expected, actual)
	}
}

func TestFoursRuleWithSomeFours(t *testing.T) {
	expected := 12
	actual := Score(Fours, [5]int{4, 1, 4, 1, 4})
	if actual != expected {
		t.Errorf("expected %v got %v", expected, actual)
	}
}

func TestFoursRuleWithAllFours(t *testing.T) {
	expected := 20
	actual := Score(Fours, [5]int{4, 4, 4, 4, 4})
	if actual != expected {
		t.Errorf("expected %v got %v", expected, actual)
	}
}

func TestFivesRuleWithZeroFives(t *testing.T) {
	expected := 0
	actual := Score(Fives, [5]int{1, 2, 3, 4, 6})
	if actual != expected {
		t.Errorf("expected %v got %v", expected, actual)
	}
}

func TestFivesRuleWithSomeFives(t *testing.T) {
	expected := 10
	actual := Score(Fives, [5]int{1, 1, 1, 5, 5})
	if actual != expected {
		t.Errorf("expected %v got %v", expected, actual)
	}
}

func TestFivesRuleWithAllFives(t *testing.T) {
	expected := 25
	actual := Score(Fives, [5]int{5, 5, 5, 5, 5})
	if actual != expected {
		t.Errorf("expected %v got %v", expected, actual)
	}
}

func TestSixesRuleWithZeroSixes(t *testing.T) {
	expected := 0
	actual := Score(Sixes, [5]int{1, 2, 3, 4, 5})
	if actual != expected {
		t.Errorf("expected %v got %v", expected, actual)
	}
}

func TestSixesRuleWithSomeSixes(t *testing.T) {
	expected := 24
	actual := Score(Sixes, [5]int{1, 6, 6, 6, 6})
	if actual != expected {
		t.Errorf("expected %v got %v", expected, actual)
	}
}

func TestSixesRuleWithAllSixes(t *testing.T) {
	expected := 30
	actual := Score(Sixes, [5]int{6, 6, 6, 6, 6})
	if actual != expected {
		t.Errorf("expected %v got %v", expected, actual)
	}
}
