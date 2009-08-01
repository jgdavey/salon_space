Feature: Layouts and Navigation
  In order to move about the site effictively
  As a user
  I want to navigate the application
  
  Scenario: From the homepage
    Given I am on the homepage
    When I follow "Clients"
    Then I should be on the list of clients page
