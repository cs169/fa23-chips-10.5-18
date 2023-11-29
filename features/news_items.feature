Feature: Seeing the news article 
  As a user,
  I want to be able to see my events 
  so I can easily view the location/date/description.

Scenario: Viewing news artcicles for a representative
  Given I am on the login page
  When I press "Sign in with Google"
  And I navigate to the events page
  And I follow "Add New Event"
  Then I should see the new events page

Scenario: Creating news articles for a representative
  Given I am on the logout page
  When I navigate to the events page
  And I follow "Add New Event"
  Then I should see the sign in page