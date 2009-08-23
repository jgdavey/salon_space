@focus
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
    And I have the following service records:
    | name    |
    | Haircut |
    | Blowdry |
    And I have the following location records:
    | name           |
    | Red7 - Chicago |
    | Home           |

    When I follow "New Appointment"
    And I fill in "Date of Appointment" with "2009-08-01"
    And I select "Jane Michaels" from "Client"
    And I select "Haircut" from "Type of Service"
    And I select "Home" from "Location"
    And I press "Save"

    Then I should see "Successfully created appointment"
    And I should be on the list of appointments page
    And I should see "Jane Michaels"
    And I should see "August 1, 2009"
    And I should see "Jane Michaels"
    And I should see "Haircut"
    And I should see "Home"


  Scenario: Update an appointment
    Given I have the following appointment records:
    | time       |
    | 2009-08-01 |
    And I am on the list of appointments page
    When I follow "Edit"
    And I fill in "Date of Appointment" with "2009-08-02"
    And I press "Save"

    Then I should see "Successfully updated appointment"
    And I should be on the list of appointments page
    And I should see "August 2, 2009"

  