After do |scenario|
  if scenario.failed?
    save_page("results/pagearchive#{Time.now.to_s}.html")
    save_screenshot("results/screenshot#{Time.now.to_s}.png")
  end
  
  page.execute_script("window.localStorage.clear()") # Gets around the problem that Capybara's reset method doesn't clear this
end