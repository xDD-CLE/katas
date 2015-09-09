from calculators.string_calculator import Calculator


def test_that_it_returns_0_for_an_empty_string():
    assert Calculator("").add() == ""


def test_that_it_returns_the_same_number_when_only_provided_one_number():
    assert Calculator("1").add() == 1


def test_that_it_adds_two_numbers():
    assert Calculator("1,2").add() == 3


def test_that_it_adds_a_heck_of_a_lot_of_numbers():
    expected_sum_of_1_to_100 = 4950
    numbers = ",".join(map(lambda num: str(num), range(1, 100)))
    actual = Calculator(numbers).add()
    assert expected_sum_of_1_to_100 == actual, "Expected %i but got %i" % (expected_sum_of_1_to_100, actual)


def test_that_it_handles_new_lines_as_delimiters():
    assert Calculator("1\n2,3").add() == 6

