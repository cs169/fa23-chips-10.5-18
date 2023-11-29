# frozen_string_literal: true

# search reps

# end

# Issue Tests
Given /^I am viewing the articles for Gavin Newsom$/ do
  @representative = Representative.create!({
                                             name:     'Gavin Newsom',
                                             title:    'Govenor of California',
                                             ocdid:    '',
                                             street:   '',
                                             city:     '',
                                             state:    'CA',
                                             party:    'Democratic party',
                                             photoUrl: nil
                                           })
  visit '/representatives/1/news_items'
end

Given /^I am logged in$/ do
  visit '/login'
  click_button('Sign in with Google')
end

# end Issues tests

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

And /^I type text "([^"]*)"$/ do |text|
  fill_in('address', with: text)
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
