#encoding: utf-8

When(/^I add (\d+) shows? to my favourites$/) do |number|
  shows = find('ul#bbc_one_london-schedule').all('a.is-available').map { |a| a[:href] }
  
  shows.slice!(number.to_i..shows.length)
  
  shows.each do |show|
	visit(show)
	find('span', :text => "Add to Favourites").click
  end
end

When(/^I remove (\d+) shows? from my favourites$/) do |number|
  sleep(3) # Wait for all items to load in
  
  number.to_i.times do
    first('li.available').find('div.remove-block').click
    sleep(3) # Wait for remove panel to slide out
    first('li.available').find('div.remove-block').click
    sleep(3) # Wait for items to delete - TODO http://www.elabs.se/blog/53-why-wait_until-was-removed-from-capybara
  end
end

Then(/^I can watch my (\d+) favourite shows?$/) do |number|
  page.should have_selector('li.available', :count => number.to_i)
  
  page.all('a.episode-link').each do |show|
    show.click
    page.find('div#player').click
    sleep(5)
    page.evaluate_script('window.history.back()')
  end
end