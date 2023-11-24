Feature: Display counties in a state when button is clicked on from state page
  As a user,
  I want to be able to see all the counties in a state when I click on the button for counties under the map

Scenario: User clicks button to display counties in a state
  Given I am viewing the Oregon map
  When I press "Counties in Oregon"
  Then I should see the counties: "Baker County", "Benton County", "Grant County"
  And the list should contain a total of 36 counties