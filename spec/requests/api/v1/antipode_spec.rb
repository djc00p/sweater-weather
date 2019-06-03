require 'rails_helper'

describe 'As a visitor' do
  it 'should return json of antipode' do
    expected = {
	'data': [{
		'id': '1',
		'type': 'antipode',
		'attributes': {
			'location_name': 'Jujuy',
			'forecast': {
				'summary': 'Clear',
				'current_temperature': '55'
			},
			'search_location': 'HongKong,CN'
		}
	}]
}

  get '/api/v1/antipode?loc=HongKong,CN'


  expect(response).to be_successful

  parsed = JSON.parse(response.body, symbolize_names: true)

  expect(parsed).to eq(expected)
  end
end
