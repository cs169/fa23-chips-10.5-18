Given /the following representatives exist/ do |representatives_table|
  representatives_table.hashes.each do |representative|
    Representative.create!(name: representative['name'], title: representative['office'])
  end
end

Given /^I am viewing the Oregon map$/ do
  visit '/state/OR'
end

When /^I click on (.*) County in the map$/ do |county_name|
  county_path = find(:xpath, "//path[@data-county-name='#{county_name}']")
  county_path.click
end

Then /^I should see the representatives: (.*)$/ do |list|
  list.split('","').each do |representative|
    step %{I should see "#{representative.strip}"}
  end
end

Then /^I should see the offices: (.*)$/ do |list|
  list.split('","').each do |office|
    step %{I should see "#{office.strip}"}
  end
end

And /^the list should contain a total of (\d+) representatives$/ do |expected_total|
  rows = all('table#events tbody tr')
  actual_total = rows.size
  expect(actual_total).to eq expected_total.to_i
end