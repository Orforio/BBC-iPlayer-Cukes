After do |scenario|
  if scenario.failed?
    save_page('results/pagearchive' + Time.now.to_s + '.html')
    save_screenshot('results/screenshot' + Time.now.to_s + '.png')
  end
end