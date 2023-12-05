Feature: Seeing the Issue Column on Articles
  As a user,
  I want to have an 'Issues' column on artciles 
  so I can tell what the artcile is about.

Background:
  Given I am logged in

Scenario: On Articles Page
  Given I am viewing the articles for Gavin Newsom
  Then I should see the text "Issue"

Scenario: When adding a new article
  Given I am viewing the articles for Gavin Newsom
  And I follow "Add News Article"
  Then I should see the text "Issue"

Scenario: Adding a new article after rep and issue
  Given I am viewing the articles for Gavin Newsom
  And I follow "Add News Article"
  And I select "Gavin Newsom" from "Representative"
  And I select "Immigration" from "Issue"
  And I press "Search"
  Then I should see the text "Select an article"

Scenario: Successfully creating new article
  Given I am viewing the articles for Gavin Newsom
  And I follow "Add News Article"
  And I select "Gavin Newsom" from "Representative"
  And I select "Immigration" from "Issue"
  And I press "Search"
  And I choose article_0_link
  And I press "Save"
  Then I should see the text "Edit news article"