Feature: Content Templates
  In order to change how the content looks and acts on the website a website editor will be able to select from predetermined templates

  Background:
    Given I am signed in as a website editor

  Scenario: Create Root Content
    Given I create a new root
    Then I should be able select a template from the following:
      | Template     |
      | Landing Page |

  Scenario Outline: Create Child Content
    Given I create a new child under a <Parent Template Name>
    Then I should be able select a template from "<Allowed Templates>"

    Examples:
      | Parent Template Name | Allowed Templates                             |
      | Home                 | Content Page                                  |
     #| Content Page         | Content Page, Event Page                      |
     #| Event Page           | Content Page                                  |

