#encoding: utf-8

Given(/^I am on the registration page$/) do
  visit('https://ssl.bbc.co.uk/id/register?ptrt=http%3A%2F%2Fwww.bbc.co.uk%2Fiplayer%2Ffavourite')
end

Given(/^I am on the iPlayer home page$/) do
  visit('/iplayer')
end

Given(/^I am logged in$/) do
  visit('https://ssl.bbc.co.uk/id/signin')
  fill_in('Email or username' :with => 'developerintest')
  fill_in('Password' :with => 'developerintest')
  click_button('Sign in')
end

When(/^I try to visit "(.+)"$/) do |url|
  visit(url)
  page.title.should_not include "Page not found"
end

When(/^I press the "(.+)" link$/) do |link|
  click_link(link)
end

When(/^I press the "(.+)" button$/) do |button|
  click_button(button)
  sleep(5)
end

When(/^I fill in the "(.+)" field with "?(.+)"?$/) do |field, contents|
  contents = case contents
  when 'a too long password'
    ')Aq/BX!<E69@ycWuSBH]^Tu*ba_4^?mS^w^FB]7*m4[?knWp`C+'
  when 'a too short password'
    '=Hn3'
  when 'the correct password'
    'developerintest'
  when 'the wrong password'
    'developer'
  when 'a registered email'
    'developerintest@sharklasers.com'
  when 'a valid email'
    "developerintest#{Time.now.to_i}@sharklasers.com"
  when 'an invalid email'
    'not valid@sharklasers.com'
  end
	  
  fill_in(field, :with => contents)
end

Then(/^I see the text "(.+)"$/) do |text|
  page.should have_text(text)
end

Then(/^I am redirected to "?(.+)"?$/) do |url|
  url = case url
  when 'the favourites page'
    '/iplayer/favourite'
  when 'the registration page'
    '/id/register'
  end
	
  current_path.should == url
end