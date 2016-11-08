require 'rails_helper'

include RequestHelper
describe 'Urls API controller' do
  it 'update the url' do
    user = create(:user, id: 42)
    url_1 = create(:url, user: user)
    url_2 = create(:url, user: user)
    url_3 = create(:url, user: user, title: 'Original Title', id: 99)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    expect(Url.find(99).title).to eq 'Original Title'

    put "/api/v1/urls/#{99}", params: {url:
                                        {title: 'Updated Title'}
                                     }

    expect(Url.find(99).title).to eq 'Updated Title'
  end
end
