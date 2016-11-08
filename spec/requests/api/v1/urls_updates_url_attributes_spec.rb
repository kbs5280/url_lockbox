require 'rails_helper'

include RequestHelper
describe 'Urls API controller creates a url' do
  it 'returns the url' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    post '/api/v1/urls', params: { url:
                                  { title: 'Twitter',
                                   url: 'https://twitter.com',
                                   user:  user.id }
                                 }

    expect(response).to be_success

    expect(json[:title]).to eq 'Twitter'
    expect(json[:url]).to eq 'https://twitter.com'
    expect(json.count).to eq 7
  end
end
