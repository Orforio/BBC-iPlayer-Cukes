require 'rspec/expectations'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'selenium-webdriver'

if ENV['PHANTOM']
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, window_size: [1280, 1024], timeout: 60, :js_errors => false, :debug => false)
  end
  Capybara.default_driver = :poltergeist
  Capybara.javascript_driver = :poltergeist
else
  Capybara.default_driver = :selenium
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end
end

Capybara.app_host = 'http://www.bbc.co.uk'

World(RSpec::Matchers)