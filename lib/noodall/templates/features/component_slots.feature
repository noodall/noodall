Feature: Component Slots
  In order that web site editors can add functionality and information to content they will be able to fill slots with components

  Scenario Outline: Component Slots
    Given a <Template Name> exists
    And I am signed in as a website editor
    When I am editing the <Template Name>
    Then I should be able to place components in <Hero Slots Per Page> hero slots
    And I should be able to place components in <Wide Slots Per Page> wide slots
    And I should be able to place components in <Small Slots Per Page> small slots

    Examples:
      | Template Name       | Hero Slots Per Page | Wide Slots Per Page | Small Slots Per Page |
      | home                | 0                   | 0                   | 4                    |
      | sports landing page | 0                   | 3                   | 6                    |
      | sport page          | 1                   | 3                   | 6                    |
      | landing page        | 1                   | 0                   | 8                    |
      | content page        | 1                   | 3                   | 6                    |
      | event page          | 1                   | 3                   | 6                    |

