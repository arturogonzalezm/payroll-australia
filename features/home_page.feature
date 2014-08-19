Feature: Home page

  Scenario: Viewing application's home page
    Given there's a page called "Employees" with "the instructions" content
    When I am on the homepage
    Then I should see the "Instructions" 