Given(/^I am on the homepage$/) do
  expect(App.home_page.editors_pick).to eq("EDITOR'S PICK")
end

When(/^I click on search bar button$/) do
  App.home_page.search_bar
end

And(/^I enter "([^"]*)" and submit$/) do |criteria|
  App.search_screen_page.enter_search criteria
  # App.search_screen_page.proceed
end

Then(/^I should be able to see search results for Australia$/) do
  expect(App.search_screen_page.search_result).to include('SEARCH RESULTS')
end

When(/^I select "([^"]*)" from country$/) do |country|
  App.home_page.set_country(country)
end

Then(/^I should see "([^"]*)" on the homepage$/) do |editorspick|
  expect(App.home_page.editors_pick).to eq(editorspick)
end

When(/^I enter and submit my email id as "([^"]*)"$/) do |email_id|
  App.home_page.enter_email email_id
  App.home_page.inspire_me
end

Then(/^I should be able to see "([^"]*)"$/) do |text|
  expect(App.home_page.confirmation).to eq text
end

When(/^I click on nav bar icon$/) do
  App.home_page.select_menu
end

