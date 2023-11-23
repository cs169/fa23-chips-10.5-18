Feature: Representative Profile
  As a user
  I want to view a representative's profile
  So that I can learn more about them

  Scenario: User views a representative's profile
    Given a representative exists
    When I visit the representative's profile page
    Then I should see the representative's details
