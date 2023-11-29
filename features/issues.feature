Feature: Seeing the Issue Column on Articles
  As a user,
  I want to have an 'Issues' column on artciles 
  so I can easily tell what the artcile is about.

Background:
  Given I am logged in

Scenario: On Articles Page
  Given I am viewing the articles for Gavin Newsom
  Then I should see the text "Issue"

Scenario: When adding a new article
  Given I am viewing the articles for Gavin Newsom
  And I follow "Add News Article"
  Then I should see the text "Issue"