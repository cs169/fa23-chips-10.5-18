require 'date'
require 'rails_helper'
require 'spec_helper'

describe Representative do

  # describe 'searching empty representatives' do
  #   it 'searches empty rep_info' do
  #     rep_info = {}
  #     expect(Representative.civic_api_to_representative_params(rep_info)).to eq([])
  #   end
  # end

  # describe "searches existing representative" do
  #   before do
  #     rep_info = !!!NEED TO CHANGE TO SOMETHING IN TABLE!!!
  #     @rep = Representative.civic_api_to_representative_params(rep_info)
  #   end
  #   it "returns list with representative" do 
  #     expect(@rep_info).to eq([rep_info])
  #   end
  #   it "appends rep to Representative table" do
  #     expect(Representative).to include (@rep)
  #   end
  # end
  describe 'searches not yet existing representative' do
    before do
      rep_info = {
        "officials": [
          { "name": "Kevin Yoder",
          "address": [{
            "line1": "215 Cannon HOB",
            "city": "washington d.c.",
            "state": "DC",
            "zip": "20515"
            }]
          }
        ], 
        "offices": [
          {"name": "United States House of Representatives KS-03",
          "level": "federal",
          "officialIndices": [0]}
        ]
      }
      @rep = Representative.civic_api_to_representative_params(rep_info)
    end
    it 'returns list with representative' do 
      expect(@rep_info).to eq([rep_info])
    end
    it 'appends rep to Representative table' do
      expect(Representative).to include (@rep.first)
    end
  end
end