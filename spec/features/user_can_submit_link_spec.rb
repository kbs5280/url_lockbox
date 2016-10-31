require 'rails_helper'

# As an authenticated user viewing the main page (links#index),
# I should see a simple form to submit a link.

describe 'When a user visits the links index', type: :feature do
  scenario 'the user sees a form to submit a link' do
    user = User.create(username: 'username',
                       password: 'password',
                       password_confirmation: 'password',
                       email_address: 'username@username.com')

    visit root_path

    click_on 'Log In'

    fill_in 'Email address', with: 'username@username.com'
    fill_in 'Password', with: 'password'
    click_on 'Login'

    expect(page).to have_content 'Enter a URL title'
  end
end
