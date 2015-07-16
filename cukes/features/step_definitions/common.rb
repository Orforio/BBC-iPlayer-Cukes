When(/^I try to visit "(.*?)"$/) do |url|
  visit(url)
  page.title.should_not include "Page not found"
end

When(/^I press the "(.*?)" link$/) do |link|
  click_link(link)
end

When(/^I press the "(.*?)" button$/) do |button|
  click_button(button)
end

When(/^I fill in the "(.*?)" field with "(.*?)"$/) do |field, contents|
  fill_in(field, :with => contents)
end

Then(/^I see the text "(.*?)"$/) do |text|
  page.should have_text(text)
end