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
