Feature: Use a UI to add numbers

  Background:
    Given Using Chrome

    Scenario: Find a result
      When I open the calculator
      Then The result is 0
      When I add 2,3,4
      Then The result is 9
      When I add 3,4,5
      Then The result is 12