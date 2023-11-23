Feature: Display Representatives upon Clicking a County in the County Map
  As a user,
  I want to view the representatives of my county on the map,
  So that I can easily find and learn about my local and national representatives.

Background: 
  Given the following representatives exist:
    | name            | office                              |
    | Joseph R. Biden | President of the United States      |
    | Kamala D. Harris| Vice President of the United States |
    | Jeff Merkley    | U.S. Senator                        |
    | Ron Wyden       | U.S. Senator                        |
    | Tina Kotek      | Governor of Oregon                  |
    | Ellen F. Rosenblum | OR State Attorney General        |
    | Tobias Read     | OR State Treasurer                  |
    | LaVonne Griffin-Valade | OR Secretary of State        |
    | Bronson D. James| OR State Supreme Court Justice      |
    | Roger J. DeHoog | OR State Supreme Court Justice      |
    | Steve Dennison  | Deschutes County Clerk              |

Scenario: Clicking on Deschutes County in Oregon Displays Correct Representatives
  Given I am viewing the Oregon map
  When I click on Deschutes County in the map
  Then I should see the representatives: "Jeff Merkley", "Ron Wyden", "Tina Kotek", "Ellen F. Rosenblum", "Tobias Read", "LaVonne Griffin-Valade", "Bronson D. James", "Roger J. DeHoog", "Steve Dennison"
  And I should see the offices: "U.S. Senator", "U.S. Senator", "Governor of Oregon", "OR State Attorney General", "OR State Treasurer", "OR Secretary of State", "OR State Supreme Court Justice", "OR State Supreme Court Justice", "Deschutes County Clerk"
  And the list should contain a total of 24 representatives
