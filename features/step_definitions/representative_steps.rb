# frozen_string_literal: true

Given('a representative exists') do
  @representative = Representative.create!({
                                             name:     'John Smith',
                                             title:    'Senator',
                                             ocdid:    'test',
                                             street:   '2 1st street',
                                             city:     'Berkeley',
                                             state:    'California',
                                             party:    'Democratic party',
                                             photoUrl: 'test'
                                           })
end

When("I visit the representative's profile page") do
  visit representative_path(@representative)
end

Then("I should see the representative's details") do
  expect(page).to have_text(@representative.name)
  expect(page).to have_text(@representative.street)
  expect(page).to have_text(@representative.city)
  expect(page).to have_text(@representative.state)
  expect(page).to have_text(@representative.party)
end
