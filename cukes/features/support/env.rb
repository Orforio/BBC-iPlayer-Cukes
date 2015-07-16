require 'rspec/expectations'
require 'capybara/cucumber'
require 'capybara/poltergeist'

if ENV['IN_BROWSER']
  Capybara.default_driver = :selenium
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :firefox)
  end
else
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, window_size: [1280, 1024], timeout: 60)
  end
  Capybara.default_driver = :poltergeist
  Capybara.javascript_driver = :poltergeist
end

Capybara.app_host = 'http://www.bbc.co.uk'

World(RSpec::Matchers)