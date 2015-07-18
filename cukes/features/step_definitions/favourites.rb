#encoding: utf-8

When(/^I add (\d+) shows? to my favourites$/) do |number|
  shows = page.find('div.tv-guide').all('a.is-available.inner--non-streaming').map { |a| a[:href] }
  
  shows.slice!(number.to_i..shows.length)
  
  shows.each do |show|
	visit(show)
	page.find('span', :text => "Add to Favourites").click
  end
end

When(/^I remove (\d+) shows? from my favourites$/) do |number|
  sleep(3) # Wait for all items to load in
  
  number.to_i.times do
    page.first('li.available').find('div.remove-block').click
    sleep(3) # Wait for remove panel to slide out
    page.first('li.available').find('div.remove-block').click
    sleep(3) # Wait for items to delete - TODO http://www.elabs.se/blog/53-why-wait_until-was-removed-from-capybara
  end
end

Then(/^I can watch my (\d+) favourite shows?$/) do |number|
  page.should have_selector('li.available', :count => number.to_i)
  
  shows = page.find('div#favourites-container').all('a.episode-link').map { |a| a[:href] }
  
  shows.each do |show|
	visit(show)
    page.should have_selector('object#smp-flashSWFplayer')
  end
end