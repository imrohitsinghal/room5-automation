Then(/^I should see "([^"]*)" on the themes page$/) do |arg|
  expect(App.theme_page.page_header).to eq('DESTINATIONS & INSPIRATION')
end