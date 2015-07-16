#encoding: utf-8

Feature: Registering for iPlayer
  As a user,
  I want to register for iPlayer,
  So that I can save my favourite programmes
  
  Scenario: Accessing registration page
    When I try to visit "/iplayer"
    And I press the "Favourites" link
    And I press the "Register" link
    Then I see the text "Register"
    And I see the text "BBC iD"
    
  Scenario: Not entering an email or password
    When I try to visit "https://ssl.bbc.co.uk/id/register?ptrt=http%3A%2F%2Fwww.bbc.co.uk%2Fiplayer%2Ffavourites"
    And I press the "Register" button
    Then I see the text "This email address is not valid"
    And I see the text "This is too short"
    
  Scenario: Not entering a valid email or password
    When I try to visit "https://ssl.bbc.co.uk/id/register?ptrt=http%3A%2F%2Fwww.bbc.co.uk%2Fiplayer%2Ffavourites"
    And I fill in the "Email" field with "not valid@email.com"
    And I fill in the "New password" field with "2shrt"
    And I press the "Register" button
    Then I see the text "This email address is not valid"
    And I see the text "This is too short"
    
  Scenario: Entering a valid email but too long password
    When I try to visit "https://ssl.bbc.co.uk/id/register?ptrt=http%3A%2F%2Fwww.bbc.co.uk%2Fiplayer%2Ffavourites"
    And I fill in the "Email" field with "developerintest@sharklasers.com"
    And I fill in the "New password" field with ")Aq/BX!<E69@ycWuSBH]^Tu*ba_4^?mS^w^FB]7*m4[?knWp`C+"
    And I press the "Register" button
    And I see the text "This is too long"
  
  Scenario: Entering a valid email and password but no confirmation password
    When I try to visit "https://ssl.bbc.co.uk/id/register?ptrt=http%3A%2F%2Fwww.bbc.co.uk%2Fiplayer%2Ffavourites"
    And I fill in the "Email" field with "developerintest@sharklasers.com"
    And I fill in the "New password" field with "developerintest"
    And I press the "Register" button
    And I see the text "These do not match"
  
  Scenario: Entering a valid email but mismatched password
    When I try to visit "https://ssl.bbc.co.uk/id/register?ptrt=http%3A%2F%2Fwww.bbc.co.uk%2Fiplayer%2Ffavourites"
    And I fill in the "Email" field with "developerintest@sharklasers.com"
    And I fill in the "New password" field with "developerintest"
    And I fill in the "Confirm password" field with "developer"
    And I press the "Register" button
    And I see the text "These do not match"