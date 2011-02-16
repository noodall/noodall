# http://www.pivotaltracker.com/story/show/8969347
Feature: Content Templates
  In order to change how the content looks and acts on the website a website editor will be able to select from predetermined templates

  Background:
    Given I am signed in as a website editor

  Scenario: Create Root Content
    Given I create a new root
    Then I should be able select a template from the following:
      | Template     |
      | Landing Page |
      | Article List |

  Scenario Outline: Create Child Content
    Given I create a new child under a <Parent Template Name>
    Then I should be able select a template from "<Allowed Templates>"

    Examples:
      | Parent Template Name | Allowed Templates                                      |
      | Home                 | none                                                   |
      | Landing Page         | Landing Page, Content Page, Sign Up Form, Article List |
      | Content Page         | Landing Page, Content Page, Sign Up Form               |
      | Sign Up Form         | Content Page                                           |
      | Article List         | Article                                                |
      | Article              | none                                                   |

