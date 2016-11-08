require 'rails_helper'

include RequestHelper
describe 'Urls API controller' do
  it 'destroys the url' do
    user = create(:user, id: 42)
    url_1 = create(:url, user: user)
    url_2 = create(:url, user: user)
    url_3 = create(:url, user: user, id: 99)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    expect(Url.where(user_id: 42).count).to eq 3

    delete "/api/v1/urls/#{url_3.id}"

    expect(Url.where(user_id: 42).count).to eq 2
  end
end
