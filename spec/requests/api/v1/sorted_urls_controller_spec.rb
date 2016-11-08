require 'rails_helper'

include RequestHelper
describe 'Sort Alphabetically Urls API controller' do
  it 'returns sorted url' do
    user = create(:user)
    url_1 = create(:url, user: user, title: 'B')
    url_2 = create(:url, user: user, title: 'C')
    url_3 = create(:url, user: user, title: 'A')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    get '/api/v1/sort_alphabetically'

    expect(response).to be_success

    expect(json.count).to eq 3
    expect(json[0][:title]).to eq url_3.title
    expect(json[1][:title]).to eq url_1.title
    expect(json[2][:title]).to eq url_2.title
  end
end
