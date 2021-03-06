@test2.m.wikipedia.org @login
Feature: Wikitext Editor (Makes actual saves)

  Background:
    Given I am logged into the mobile website

  @editing @integration
  Scenario: It is possible to edit
    Given I go to a page that has languages
    When I click the edit button
      And I see the wikitext editor overlay
      And I type "ABC GHI" into the editor
      And I click continue
      And I click submit
      And I do not see the wikitext editor overlay
    Then I should see a toast notification

  @editing @en.m.wikipedia.beta.wmflabs.org
  Scenario: Redirects
    Given the page "Selenium wikitext editor test" exists
      And I am on a page that does not exist
    When I click the edit button
      And I clear the editor
      And I type "#REDIRECT [[Selenium wikitext editor test]]" into the editor
      And I click continue
      And I click submit
      And I say OK in the confirm dialog
      And I do not see the wikitext editor overlay
    Then the text of the first heading should be "Selenium wikitext editor test"

  @editing @en.m.wikipedia.beta.wmflabs.org
  Scenario: Broken redirects
    Given I am on a page that does not exist
    When I click the edit button
      And I clear the editor
      And I type "#REDIRECT [[AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA]]" into the editor
      And I click continue
      And I click submit
      And I say OK in the confirm dialog
      And I do not see the wikitext editor overlay
    Then there should be a red link with text "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
