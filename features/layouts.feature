Feature: Layouts and Navigation
  In order to move about the site effictively
  As a user
  I want to navigate the application

  Background:
    Given a user with email and password "bob@example.com/secret"
    And I am logged in as "bob@example.com/secret"


  Scenario: From the homepage to Clients
    Given I am on the homepage
    When I follow "Clients"
    Then I should be on the list of clients page


  Scenario: From the homepage to Appointments
    Given I am on the homepage
    When I follow "Appointments"
    Then I should be on the list of appointments page

  Scenario: No menu unless logged in
    Given I am not logged in
    When I am on the homepage
    Then I should not see "Appointments"
    And I should not see "Clients"
