Feature: Manage Clients
  In order to know exactly who I have contact with
  As a salon working
  I want to manage a list of clients
  
  Background:
    Given a user with email and password "bob@example.com/secret"
    Given I am logged in as "bob@example.com/secret"
  
  Scenario: No access unless logged in
    Given I am not logged in
    When I go to the list of clients page
    Then I should see "You must be logged in to view this"

  Scenario: Adding a new client
    Given I have no clients
    When I go to the new client page
    And I fill in "Name" with "Jessie Jay"
    And I fill in "Phone" with "222-344-2221"
    And I press "Save"
    Then I should see "New Client saved!"
    And I should have 1 client

  Scenario: Seeing a list of all clients
    Given the following clients:
    | name       |
    | Jane Doe   |
    | Sam Noogat |
    When I go to the list of clients page
    Then I should see "Jane Doe"
    And I should see "Sam Noogat"

  Scenario: Editing a client
    Given the following clients:
    | name       |
    | Jane Doe   |
    And I am on the list of clients page
    When I follow "Edit"
    Then I should be on the edit page for the client named "Jane Doe"
    And I should see "Editing Jane Doe"

  Scenario: Removing a client
    Given I have 3 clients
    And I am on the list of clients page
    When I follow "Delete"
    Then I should be on the list of clients page
    And I should see "Successfully removed client"
    And I should have 2 clients

