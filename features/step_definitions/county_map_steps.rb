# frozen_string_literal: true

Given /the following representatives exist/ do |representatives_table|
  representatives_table.hashes.each do |representative|
    Representative.create!(name: representative['name'], title: representative['office'])
  end
end

Given /^I am viewing the Oregon map$/ do
  visit '/state/OR'
  # expect(page).to have_current_path('/state/OR', url: true)
  # click_button('Counties in Oregon')
end

When /^I click on (.* County) in the map$/ do |county_name|
  # within('table#actionmap-state-counties-table') do
  # county_row = find('tr', text: "#{county_name} County")
  # county_row.find('a', text: 'View').click
  state = State.find_by(name: 'Oregon')
  address = "#{county_name}, #{state}"
  visit search_representatives_path(address: address)
end

Then /^I should see the representatives: (.*)$/ do |list|
  representatives = list.split('", "').map { |name| name.gsub(/(^"|"$)/, '') }
  representatives.each do |representative|
    expect(page).to have_content(representative.strip)
  end
end

Then /^I should see the offices: (.*)$/ do |list|
  offices = list.split('", "').map { |name| name.gsub(/(^"|"$)/, '') }
  offices.each do |office|
    expect(page).to have_content(office.strip)
  end
end

And /^the list should contain a total of (\d+) representatives$/ do |expected_total|
  rows = all('table#events tbody tr')
  actual_total = rows.size
  expect(actual_total).to eq expected_total.to_i
end
