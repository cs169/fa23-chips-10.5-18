Feature: Use search button from home page
  As a user,
  I want to search representatives,
  So that I can easily find and learn about representatives.

Background: 
 Given I am on the home page

Scenario: Using search button gives list of representatives
  When I follow "Search"
  And I type text "Seattle"
  And I press "Search"
  Then I should see the text "Governor of Washington"