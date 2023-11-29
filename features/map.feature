Feature: Map of States and Counties
  As a user
  I want to view states and counties,
  So that I can see their representatvies

Scenario: Clicking on a state
  Given I am on the home page
  And I click on California state
  Then I should see the text "California"
