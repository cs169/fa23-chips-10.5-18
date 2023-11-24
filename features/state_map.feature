Feature: Display counties in a state when clicked on from country map
  As a user,
  I want to be able to choose a state by clicking on the state image on the country map
  so I can view the counties in a state.

Scenario: User clicks a state on the country map
  Given I am on the home page
  When I click on California state on the map
  Then I should see the state text