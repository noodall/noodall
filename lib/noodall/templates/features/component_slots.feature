# http://www.pivotaltracker.com/story/show/8969343
Feature: Component Slots
  In order that web site editors can add functionality and information to content they will be able to fill slots with components

  Background:
    Given I am signed in as a website editor

  Scenario Outline: Component Slots
    Given a <Template Name> exists
    When I am editing the <Template Name>
    Then I should be able to place components in <Hero> hero slots
    And I should be able to place components in <Large> large slots
    And I should be able to place components in <Small> small slots
    And I should be able to place components in <Call> call slots
    And I should be able to place components in <Promo> promo slots

    Examples:
      | Template Name | Hero | Large | Small | Call | Promo |
      | Home          | 1    | 0     | 2     | 4    | 4     |
      | Landing Page  | 1    | 0     | 10    | 0    | 0     |
      | Content Page  | 0    | 3     | 10    | 0    | 0     |
      | Sign Up Form  | 0    | 0     | 0     | 0    | 0     |
      | Article List  | 0    | 0     | 5     | 0    | 0     |
      | Article       | 0    | 3     | 5     | 0    | 0     |

    @javascript
  Scenario Outline: Available Slots
    Given I am placing a component in a <Slot Name> slot
    Then I should be able choose from the components <Avaiable Components>

    Examples:
      | Slot Name | Avaiable Components                                                                                                          |
      | Hero      | Carousel                                                                                                                     |
      | Large     | Call To Action, General Content, Quote, Gallery, Logo Ticker, Twitter, Latest Articles, Asset Download                       |
      | Small     | Call To Action, Call To Action Image, General Content, Quote, Gallery, Logo Ticker, Twitter, Latest Articles, Asset Download |
      | Call      | Call To Action, Call To Action Image                                                                                         |
      | Promo     | General Content                                                                                                              |

