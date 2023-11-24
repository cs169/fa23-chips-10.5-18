Feature: Login using Github and Google
  As a user,
  I want to login through Github and Google,
  So that I dont need to create an account.

Background: 
 Given I am on the login page

Scenario: Clicking "Sign in with Google" works
  When I press "Sign in with Google"
  Then I should see the home page

Scenario: Clicking "Sign in with GitHub" works
  When I press "Sign in with GitHub"
  Then I should see the home page

Scenario: Trying to login twice
  When I press "Sign in with Google"
  And I am on the login page
  Then I should see the text "You are already logged in. Logout to switch accounts."

Scenario: Logging out works
  When I press "Sign in with Google"
  And I am on the logout page
  Then I should see the text "You have successfully logged out."
