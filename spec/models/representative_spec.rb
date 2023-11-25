# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe Representative, type: :model do
  before do
    @rep = described_class.new(
      name:     'John Doe',
      ocdid:    'example',
      title:    'Senator',
      street:   '1 2nd street',
      city:     'Berkeley',
      state:    'California',
      party:    'Democratic party',
      photoUrl: 'test'
    )
  end

  it 'is valid with valid attributes' do
    expect(@rep).to be_valid
  end
end
