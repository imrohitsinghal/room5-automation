require 'rmagick'

And(/^I select "([^"]*)" under inspiration$/) do |option|
  App.menu_page.select_menu_option option
end

def create_gif scenario_name
  gif_images = Magick::ImageList.new(*$IMAGE_ARR)
  gif_images.delay = 200
  gif_images.write("results/#{scenario_name}.gif")
end

Then /^I compare the screen for "(.*?)"(?: with acceptable difference "(.*?)" percentage|)$/ do |page_name, acceptable_diff|
  acceptable_diff.nil? ? (acceptance = 0.3) : (acceptance = acceptable_diff)
  sleep(2)
  diff = nakal_execute(page_name, {:acceptable_diff => acceptance.to_f})
  if (ENV['NAKAL_MODE'] != "build")
    if diff > acceptance.to_f
      Nakal.embed_screenshot = true
    end
  end
end

When(/^I scroll down$/) do
  App.home_page.scroll_to_bottom
end

When(/^I click to "([^"]*)" nav bar icon$/) do |action|
  action=='open' ? App.home_page.select_menu : App.menu_page.close_nav_menu
end