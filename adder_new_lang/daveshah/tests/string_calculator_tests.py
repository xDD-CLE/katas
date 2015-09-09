from calculators.string_calculator import Calculator


def test_that_it_returns_0_for_an_empty_string():
    calculator = Calculator("")
    assert calculator.add() == ""


def test_that_it_returns_the_same_number_when_only_provided_one_number():
    calculator = Calculator("1")
    assert calculator.add() == 1


def test_that_it_adds_two_numbers():
    calculator = Calculator("1,2")
    assert calculator.add() == 3
