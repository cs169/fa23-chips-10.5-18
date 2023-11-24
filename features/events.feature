Feature: Use the events page
  As a user,
  I want to be able to see my events 
  so I can easily view the location/date/description.

Scenario: When you are already logged in
  Given I am on the login page
  When I press "Sign in with Google"
  And I navigate to the events page
  And I follow "Add New Event"
  Then I should see the new events page

Scenario: When you are not logged in
  Given I am on the logout page
  When I navigate to the events page
  And I follow "Add New Event"
  Then I should see the sign in page

Scenario: Adding BLANK new event when logged in
  Given I am on the login page
  When I press "Sign in with Google"
  And I navigate to the events page
  And I follow "Add New Event"
  And I press "Save"
  Then I should see the text "County must exist"