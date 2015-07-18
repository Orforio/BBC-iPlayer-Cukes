#encoding: utf-8
@active
Feature: Registering for iPlayer
  As a new user,
  I want to register for iPlayer,
  So that I can save my favourite programmes
  
  Scenario: Accessing registration page
    When I try to visit "/iplayer"
    And I press the "Favourites" link
    And I press the "Register" link
    Then I am redirected to the registration page
    And I see the text "Register"
    
  Scenario: Cancelling registration
    Given I am on the registration page
    When I press the "Cancel" link
    Then I am redirected to the favourites page
    
  Scenario: Not entering an email or password
    Given I am on the registration page
    When I press the "Register" button
    Then I see the text "This email address is not valid"
    And I see the text "This is too short"
    
  Scenario: Entering an invalid email and too short password
    Given I am on the registration page
    When I fill in the "Email" field with an invalid email
    And I fill in the "New password" field with a too short password
    And I press the "Register" button
    Then I see the text "This email address is not valid"
    And I see the text "This is too short"
    
  Scenario: Entering a valid email but too long password
    Given I am on the registration page
    When I fill in the "Email" field with a valid email
    And I fill in the "New password" field with a too long password
    And I press the "Register" button
    Then I see the text "This is too long"
  
  Scenario: Entering a valid email and password but no confirmation password
    Given I am on the registration page
    When I fill in the "Email" field with a valid email
    And I fill in the "New password" field with the correct password
    And I press the "Register" button
    Then I see the text "These do not match"
  
  Scenario: Entering a valid email but mismatched password
    Given I am on the registration page
    When I fill in the "Email" field with a valid email
    And I fill in the "New password" field with the correct password
    And I fill in the "Confirm password" field with the wrong password
    And I press the "Register" button
    Then I see the text "These do not match"
    
  Scenario: Entering an incomplete email and an insecure password
    Given I am on the registration page
    When I fill in the "Email" field with an incomplete email
    And I fill in the "New password" field with an insecure password
    And I fill in the "Confirm password" field with an insecure password
    And I press the "Register" button
    Then I see the text "This email address is not valid"
    And I see the text "Your password is insecure"
    
  Scenario: Entering a duplicate email
    Given I am on the registration page
    When I fill in the "Email" field with a registered email
    And I press the "Register" button
    Then I see the text "This email address is already registered"
    
  Scenario: Entering a valid email and password
    Given I am on the registration page
    When I fill in the "Email" field with a valid email
    And I fill in the "New password" field with the correct password
    And I fill in the "Confirm password" field with the correct password
    And I press the "Register" button
    Then I see the text "Your registration is complete"
    When I press the "Continue" link
    Then I am redirected to the favourites page