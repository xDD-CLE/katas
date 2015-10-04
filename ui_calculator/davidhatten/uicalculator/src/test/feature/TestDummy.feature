Feature: Dummy Index

  Background:
    Given Using Chrome

  Scenario: Get to the index
    When I open the app
    Then I see Spring Boot And Thymeleaf!
    Then I see Hello stranger!

  Scenario: Use QueryParams
    When I open the app
    And I name myself CukeTest
    Then I see Hello CukeTest!