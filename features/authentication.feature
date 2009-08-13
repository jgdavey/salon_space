Feature: Authentication
  In order to login securely
  As a User
  I want to login
  
  Scenario: Register new user
    Given I am on the signup page
    And there are no users
    When I fill in "email" with "bob@example.com"
    And I fill in "password" with "secret"
    And I fill in "password confirmation" with "secret"
    And I press "Submit"
    Then I should see "Thanks for signing up"
    
  Scenario: Signing in
    Given a user with email and password "bob@example.com/secret" 
    And I am on the login page
    When I fill in "email" with "bob@example.com"
    And I fill in "password" with "secret"
    And I press "Log in"
    Then I should see "Successfully logged in"
    
  Scenario: Signing out
    Given a user with email and password "bob@example.com/secret"
    And I am logged in as "bob@example.com/secret"
    When I go to logout
    Then I should see "Successfully logged out"

  Scenario: Going to logout when no session
    Given a user with email and password "bob@example.com/secret"
    And I am logged in as "bob@example.com/secret"
    When I go to logout
    Then I should see "Successfully logged out"

    When I go to logout
    Then I should see "You were already logged out"
