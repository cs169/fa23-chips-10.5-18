require 'rails_helper'
require 'spec_helper'

describe MapController do
  describe 'searching county' do
    before :each do
      @fake_state = class_double('California')
      @fake_counties = [class_double('Los Angeles'), class_double('Orange County')]
    end
    it 'basic test' do
      get :county
    end

    it 'searches for a valid state with initials' do
      allow(State).to receive(:find_by).with('CA').
        and_return(@fake_state)
      get :county, {:params => {:state_symbol => 'CA'}}
      state_symbol
    end
    it 'searches for valid counties with a state.id' do
      expect(MapController).to have_receive(:county).and_return(@fake_counties)
      get :county, {:params => {:state_symbol => 'CA'}}
    end
  end



describe 'after searching county' do
    before :each do
      @fake_county = [class_double(county: 'Los Angeles')]
      allow(MapController).to receive(:get_requested_county).and_return(@fake_county)
      get :county, {:params => 'CA'}
    end
    it 'should render the county view' do
      expect(response).to render_template('county')
    end
    # it 'makes the TMDb search results available to that template' do
    #   expect(assigns(:county)).to eq(@fake_results)
    # end
  end
end