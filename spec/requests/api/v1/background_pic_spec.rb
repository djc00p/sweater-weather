require 'rails_helper'


describe 'As a visitor' do
  it 'background image' do
    # VCR.use_cassette('forecast/') do
    get '/api/v1/background?location=denver,co'

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)
    # end
  end
end
