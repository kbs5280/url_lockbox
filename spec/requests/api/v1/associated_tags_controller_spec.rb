require 'rails_helper'

include RequestHelper
describe 'Associated Tagged Urls API controller' do
  it 'returns associated tagged url' do
    user = create(:user)
    url_1 = create(:url, user: user, tag: 'yes')
    url_2 = create(:url, user: user, tag: 'yes')
    url_3 = create(:url, user: user, tag: 'no')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    get '/api/v1/associated_tags', params: {url:
                                            {tag: 'yes'}
                                           }

    expect(response).to be_success

    expect(json.count).to eq 2
  end
end
