# frozen_string_literal: true

# Issue Tests
Given /^I am viewing the articles for Gavin Newsom$/ do
  @representative = Representative.create!({
                                             name:     'Joe Biden',
                                             title:    'President of the United States',
                                             ocdid:    '445',
                                             street:   '1600 Pennsylvania Avenue Northwest',
                                             city:     'Washington',
                                             state:    'DC',
                                             party:    'Democratic party',
                                             photoUrl: nil
                                           })
  visit '/representatives/1/news_items'
end

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
  expect(page).to have_content('Search for a Representative')
end

Then /^I should see the home page$/ do
  expect(page).to have_content('National Map')
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
  fill_in('address', with: 'Washington')
end

Then /^I should see text$/ do
  expect(page).to have_content('Governor of Washington')
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

Then /^I should see the state text$/ do
  expect(page).to have_text('California')
end

# Events page

Given /^I am on the events page$/ do
  visit '/events'
end

Then /^I should see the new events page$/ do
  expect(page).to have_content('New event')
end

Then /^I should see the sign in page$/ do
  expect(page).to have_content('Sign In')
end

When /^I navigate to the events page$/ do
  visit '/events'
end
