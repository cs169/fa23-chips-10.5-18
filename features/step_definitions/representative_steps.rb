# frozen_string_literal: true

Given /a representative exists/  do
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
end

When /I visit the representative's profile page/ do
  visit representative_path(@representative)
end

Then /I should see the representative's details/ do
  expect(page).to have_text(@representative.name)
  expect(page).to have_text(@representative.street)
  expect(page).to have_text(@representative.city)
  expect(page).to have_text(@representative.state)
  expect(page).to have_text(@representative.party)
end
