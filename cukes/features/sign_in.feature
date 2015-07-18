#encoding: utf-8

Feature: Signing into iPlayer
  As an existing user,
  I want to sign in to iPlayer,
  So that I can access my favourite programmes
  
  Scenario: Accessing sign in page
    When I try to visit "/iplayer"
    And I press the "Favourites" link
    And I press the sign in link
    Then I am redirected to the sign in page
    And I see the text "Sign in"
    
  Scenario: Cancelling sign in
    Given I am on the sign in page
    When I press the "Cancel" link
    Then I am redirected to the favourites page
    
  Scenario: Not entering an email or password
    Given I am on the sign in page
    When I press the "Sign in" button
    Then I see the text "This is too short"
    
  Scenario: Entering an invalid email and too short password
    Given I am on the sign in page
    When I fill in the "Email or username" field with an invalid email
    And I fill in the "Password" field with a too short password
    And I press the "Sign in" button
    Then I see the text "This isn't quite an email address"
    And I see the text "This is too short"
  
  Scenario: Entering an incomplete email and no password
    Given I am on the sign in page
    When I fill in the "Email or username" field with an incomplete email
    And I press the "Sign in" button
    Then I see the text "This isn't quite an email address"
    And I see the text "This is too short"
    
  Scenario: Entering a valid email but too long password
    Given I am on the sign in page
    When I fill in the "Email or username" field with the registered email
    And I fill in the "Password" field with a too long password
    And I press the "Sign in" button
    Then I see the text "This is too long"
    
  Scenario: Entering a valid email and password
    Given I am on the sign in page
    When I fill in the "Email or username" field with the registered email
    And I fill in the "Password" field with the correct password
    And I press the "Sign in" button
    Then I am redirected to the favourites page
    And I see the text "Your account"