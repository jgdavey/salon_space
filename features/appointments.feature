Feature: Managing Appointments
  So that I can effictively schedule clients
  As a Salon Professional
  I want to manage past and present client appointments


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

  