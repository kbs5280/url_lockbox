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
    expect(json.count).to eq 8
  end
end

describe 'Urls API controller does not create a url' do
  it 'if it is not validated' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    post '/api/v1/urls', params: { url:
                                 { title: 'Twitter',
                                   url: '',
                                   user:  user.id }
                                 }

   expect(response).not_to be_success

   expect(json[:title]).to eq nil
   expect(json.count).to eq 1
  end
end
