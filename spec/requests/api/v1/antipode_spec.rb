require 'rails_helper'

describe 'As a visitor' do
  it 'should return json of antipode' do
#     expected = {
#     "data": [
#         {
#             "id": "1",
#             "type": "antipode",
#             "attributes": {
#                 "location_name": "Antipode City Name",
#                 "forecast": {
#                     "summary": "Mostly Cloudy,
#                     "current_temperature": "72",
#                 				},
#             "search_location": "Hong Kong"
#             }
#         }
#     ]
# }

  get '/api/v1/antipode?loc=hongkong'


  expect(response).to be_successful

  parsed = JSON.parse(response.body, symbolize_names: true)

  expect(parsed).to eq(expected)
  end
end
