#encoding: utf-8

Given(/^I am on the registration page$/) do
  visit('https://ssl.bbc.co.uk/id/register?ptrt=http%3A%2F%2Fwww.bbc.co.uk%2Fiplayer%2Ffavourite')
end

Given(/^I am on the sign in page$/) do
  visit('https://ssl.bbc.co.uk/id/signin?ptrt=http%3A%2F%2Fwww.bbc.co.uk%2Fiplayer%2Ffavourites')
end

When(/^I press the sign in link$/) do
  page.find('.id4-cta-signin').click
end

When(/^I fill in the "(.+)" field with (?:an?|the) (.+)$/) do |field, contents|
  contents = case contents
  when 'too long password'
    ')Aq/BX!<E69@ycWuSBH]^Tu*ba_4^?mS^w^FB]7*m4[?knWp`C+'
  when 'too short password'
    '=Hn3'
  when 'correct password'
    'developerintest'
  when 'wrong password'
    'developer'
  when 'insecure password'
    'password'
  when 'registered email'
    'developerintest@sharklasers.com'
  when 'valid email'
    "developerintest#{Time.now.to_i}@sharklasers.com"
  when 'invalid email'
    'not valid@sharklasers.com'
  when 'incomplete email'
    'notvalid@sharklasers'
  else
    contents
  end
	  
  fill_in(field, :with => contents)
end