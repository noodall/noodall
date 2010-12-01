@website
Feature: Main Navigation
  The main navigation will enable users to quickly get to wherever they want to be

  Scenario: Play Sports Main Navigation Drop Downs
    Given the "Play Sport" Landing Page exists
    And the Landing Page has 5 Sports Landing Page children
    And the Landing Page has 5 Landing Page children
    And each child has 5 children
    When I go to the website
    And I hover my mouse over "Play Sport" in the main navigation
    Then I should only see the links to the 5 Landing Page children
    And when I hover over a child
    Then I should see links to the child’s children

  Scenario Outline: Other Main Navigation Drop Downs
    Given the "<Page Name>" Landing Page exists
    And the Landing Page has 5 children
    And each child has 5 children
    When I go to the website
    And I hover my mouse over "<Page Name>" in the main navigation
    Then I should see the links to the 5 children
    And when I hover over a child
    Then I should see links to the child’s children

    Examples:
      | Page Name    |
      | Get Social   |
      | All About Us |

