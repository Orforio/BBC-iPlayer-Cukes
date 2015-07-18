#encoding: utf-8

Given(/^I am on the iPlayer home page$/) do
  visit('/iplayer')
end

When(/^I add (\d+) shows? to my favourites$/) do |number|
  shows = page.find("//div[@class='tv-guide']").all(".//a[contains(@class, 'is-available') and contains(@class, 'inner--non-streaming')]").map { |a| a[:href] }
  
  shows.slice!(number..shows.length)
  
  shows.each do |show|
	visit(show)
	page.find('//span', :text => "Add to Favourites").click
	visit(show) # Verifying that page was added to favourites
	page.should have_text('Added to Favourites')
  end
end

When(/^I remove (\d+) shows? from my favourites$/) do |number|  
  number.times do
    page.find("//ul[@id='programme-container']/li[1]/div[@class='remove-block']/button[@class='confirm-icon']").click
    page.find("//ul[@id='programme-container']/li[1]/div[@class='remove-block']/button[@class='confirm-link']").click
  end
end

Then(/^I can watch my (\d+) favourite shows?$/) do |number|
  page.should have_selector("//li[contains(@class, 'available')]", :count => number) # Check that we have the expected number of favourites
  
  shows = page.find("//ul[@id='programme-container']").all(".//a[contains(@class, 'episode-link')]").map { |a| a[:href] }
  
  shows.each do |show|
	visit(show)
    page.should have_selector("//object[@id='smp-flashSWFplayer']") # Check that video exists on page
  end
end