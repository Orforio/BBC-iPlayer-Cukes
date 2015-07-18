#encoding: utf-8

Feature: iPlayer Favourites
  As a user,
  I want to add favourite programmes
  So that I can save them for later
    
  Scenario: Adding 3 favourite programmes, removing 1 and watching the other 2
    Given I am on the iPlayer home page
    When I press the "TV Guide" link
    And I add 3 shows to my favourites
    And I press the "Favourites" link
    And I remove 1 show from my favourites
    Then I can watch my 2 favourite shows