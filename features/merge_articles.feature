Feature: Merge Articles
  As a blog administrator 
  In order to reduce redundancy
  I should be able to merge two similar articles into a single article

  Background:
    Given the blog is set up
    Given a publisher "steve" exists
    Given a publisher "mary" exists
    Given the following articles exist:
    | title | author | body |
    | First article | steve | stuff |
    | Second article | mary | nonsense |


  Scenario: When two articles are merged, the merged article should contain the text of both previous articles"
    Given I am logged into the admin panel
    When I go to the edit page for "First article"
    Then I should see "New article"
    And the "article_title" field should contain "First article"
    And I should see "Merge Articles"
    When I merge with "Second article"
    Then I should be on the edit page for "First article"
    And the "article_title" field should contain "First article"
    And the "article_body" field should contain "stuff"
    And the "article_body" field should contain "nonsense"


  Scenario: A non-admin cannot merge two articles
    Given I am logged in as "steve"
    When I go to the edit page for "First article"
    Then I should see "New article"
    And the "article_title" field should contain "First article"
    But I should not see "Merge articles"

