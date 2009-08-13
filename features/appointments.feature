Feature: Managing Appointments
  So that I can effictively schedule clients
  As a Salon Professional
  I want to manage past and present client appointments

  Background:
    Given a user with email and password "bob@example.com/secret"
    Given I am logged in as "bob@example.com/secret"


  Scenario: Adding a new appointment
    Given I am on the list of appointments page
    And I have a client named "Jane Michaels"
    When I follow "New Appointment"
    And I select "August 1, 2009" as the "Date of Appointment" date
    And I select "Jane Michaels" from "Client"
    And I press "Save"
    Then I should see "Successfully created appointment"
    And I should see "Jane Michaels"
    And I should be on the list of appointments page
    And I should see "August 1, 2009"


  Scenario: Update an appointment
    Given I have the following appointment records:
    | time       |
    | 2009-08-01 |
    And I am on the list of appointments page
    When I follow "Edit"
    And I select "August 2, 2009" as the "Date of Appointment" date
    And I press "Save"
    Then I should see "Successfully updated appointment"
    And I should be on the list of appointments page
    And I should see "August 2, 2009"

  