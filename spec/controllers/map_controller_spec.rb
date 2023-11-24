require 'rails_helper'
require 'spec_helper'

describe MapController do
  describe 'searching county' do
    before :each do
      @fake_State = double('California')
      @fake_Counties = [double('Los Angeles'), double("Orange County")]
    end
    it 'searches for a valid state with initials' do
      expect(State).to receive(:find_by).with('CA').
        and_return(@fake_State)
      get :county, {:state_symbol => 'CA'}
      state_symbol
    end
    it 'searches for valid counties with a state.id' do
      expect(MapController).to receive(:get_requested_county).with('06').
        and_return(@fake_Counties)
      get :county, {:params => {:state_symbol => 'CA'}}
    end
  end



describe 'after searching county' do
    before :each do
      @fake_County = [double('Los Angeles')]
      allow(MapController).to receive(:get_requested_county).and_return(@fake_County)
      get :county, {:params => 'CA'}
    end
    it 'should render the county view' do
      expect(response).to render_template('county')
    end
    it 'makes the TMDb search results available to that template' do
      expect(assigns(:county)).to eq(@fake_results)
    end
  end
end 