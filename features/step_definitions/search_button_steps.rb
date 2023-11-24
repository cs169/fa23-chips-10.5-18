
Given /^I am on the home page$/ do
  visit '/'
end

Given /^I am on the login page$/ do
  visit '/login'
end

Given /^I am on the logout page$/ do
  visit '/logout'
end

Then /^I should see the search button$/ do 
  expect(page).to have_content("Search for a Representative")
end  

Then /^I should see the home page$/ do 
  expect(page).to have_content("National Map")
end

Then /^I should see the text "([^"]*)"$/ do |text|
  expect(page).to have_content(text)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

And /^I type text$/ do
  fill_in('address', :with => 'Washington')
end   

Then /^I should see text$/ do 
  expect(page).to have_content("Governor of Washington")
end  

And /^the list should contain a total of (\d+) counties$/ do |expected_total|
  rows = all('table#events tbody tr')
  actual_total = rows.size
  expect(actual_total).to eq expected_total.to_i
end

Then /^I should see the counties: (.*)$/ do |list|
  counties = list.split('", "').map { |name| name.gsub(/(^"|"$)/, '') }
  counties.each do |county|
    expect(page).to have_content(county)
  end 
end  

When /^I click on California state on the map$/ do
  # visit '/state/California'
  # visit :state_map('CA')
  # visit '/state/:state_symbol'(state_symbol: 'CA')
  # visit state_map_path('CA')
  # find(:css, ".actionmap-view-region").click
  find('#actionmap-national-view').click
  # actionmap-national-view
  # actionmap-view-region
end

Then /^I should see the state text$/ do
  expect(page).to have_text("California")
  # find(:button, name: 'Counties in Oregon')
end 

# Events page

Given /^I am on the events page$/ do
  visit '/events'
end

Then /^I should see the new events page$/ do 
  expect(page).to have_content("New event")
end 

Then /^I should see the sign in page$/ do 
  expect(page).to have_content("Sign In")
end

When /^I navigate to the events page$/ do 
  visit '/events'
end 