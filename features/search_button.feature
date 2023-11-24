Feature: Use search button from home page
  As a user,
  I want to search representatives,
  So that I can easily find and learn about representatives.

Background: 
 Given I am on the home page

Scenario: Clicking on Search button takes user to search page
  When I follow "Search"
  Then I should see the search button


Scenario: Searching for Washington Representatives
  When I follow "Search"
  And I type text
  And I press "Search"
  Then I should see text
