require 'rails_helper'

describe 'When a user visits the links index', type: :feature do
  let(:user){ create(:user) }
  let(:url){ create(:url, user: user) }

  scenario 'the user can submit a link', :js => true do

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    expect(page).to have_content 'Enter a URL title'

    fill_in 'title', with: 'Twitter'
    fill_in 'url', with: 'https://twitter.com'
    click_on 'Submit a link'

    expect(page).to have_content 'Twitter'
  end
end
