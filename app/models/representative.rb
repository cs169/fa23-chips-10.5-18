# frozen_string_literal: true

class Representative < ApplicationRecord
  has_many :news_items, dependent: :delete_all

  def self.civic_api_to_representative_params(rep_info)
     reps = []
     rep_info.officials.each_with_index.map do |official, index|
      office_data = extract_office_data(rep_info, index)
      address_data = format_address(official.address&.first)
      rep = office_data.merge(address_data).merge({
                                                    name:     official.name,
                                                    party:    official.party,
                                                    photoUrl: official.photo_url
                                                  })
      
      rep = Representative.find_by(name: official.name)
      if rep.nil?
        Representative.create!(rep)
        
        
      end
      reps.push(rep)
    end
    reps
  end

  def self.extract_office_data(rep_info, index)
    office = rep_info.offices.find { |o| o.official_indices.include? index }
    { ocdid: office&.division_id, title: office&.name }
  end

  def self.format_address(address)
    {
      street: [address&.line1, address&.line2, address&.line3].compact.join(' '),
      city:   address&.city,
      state:  address&.state,
      zip:    address&.zip
    }
  end
end
