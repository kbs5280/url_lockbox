require 'rails_helper'

describe 'When a user visits the links index', type: :feature do

  xscenario 'the user can submit a link', :js => true do
    user = User.create(username: 'username',
                       password: 'password',
                       password_confirmation: 'password',
                       email_address: 'username@username.com')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    expect(page).to have_content 'Enter a URL title'

    fill_in 'title', with: 'Amazon Instant'
    fill_in 'url', with: 'https://www.amazon.com/Instant-Video/b?node=2858778011'
    click_on 'Submit a link'

    expect(page).to have_content 'Twitter'
    expect(page).to have_content 'https://twitter.com/'
  end
end
