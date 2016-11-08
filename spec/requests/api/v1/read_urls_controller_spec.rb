require 'rails_helper'

include RequestHelper
describe 'Read Urls API controller' do
  it 'returns unread urls' do
    user = create(:user)
    url_1 = create(:url, user: user)
    url_2 = create(:url, user: user, read: true)
    url_3 = create(:url, user: user, read: true)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    get '/api/v1/read_urls'

    expect(response).to be_success

    expect(json.count).to eq 2
    expect(json.count).not_to eq 3
  end
end
