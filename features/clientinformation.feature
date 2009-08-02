Feature: Managing Clients' Information
  In order to keep relevant, uptodate information about my clients
  As a Salon Professional
  I want to edit and manage clients' contact information
  
  Scenario: Viewing basic information
    Given the following clients:
    | name         | phone        | email               |
    | Janet Parker | 222-234-1231 | jparker@example.com |
    | Lindsay Ono  | 123-123-1234 | lono@example.com    |
    When I am on the list of clients page
    Then I should see these rows:
    | Name         | Phone        | Email               |
    | Janet Parker | 222-234-1231 | jparker@example.com |
    | Lindsay Ono  | 123-123-1234 | lono@example.com    |
  
  
  
