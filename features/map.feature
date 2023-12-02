Feature: Map of States and Counties
  As a user
  I want to view states and counties,
  So that I can see their representatvies

Scenario: Clicking on a state
  Given I am on the home page
  And I click on California state
  Then I should see the text "California"

Scenario: Clicking on a county from state page
  Given I am on the home page
  And I click on California state
  And I press "Counties in California"
  Then I should see a table of counites

Scenario: Getting correct errors for state
  Given I am on the home page
  And I navigate to a state that does not exist
  Then I should see the text "State 'CC' not found."

Scenario: Getting correct errors for county
  Given I am on the home page
  And I click on California state
  And I navigate to a county that does not exist
  Then I should see the text "County with code '000' not found for CA" 