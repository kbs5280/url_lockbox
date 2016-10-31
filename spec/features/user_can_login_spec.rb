require 'rails_helper'

describe 'When an unauthenticated user is redirected to sign up/sign in', type: :feature do
  scenario 'the user can create an account' do
    user = User.create(username: 'username', password: 'password', password_confirmation: 'password', email_address: 'username@username.com')

    visit root_path

    expect(current_path).not_to eq root_path
    expect(current_path).to eq dashboard_path

    click_on 'Login'

    expect(current_path).to eq login_path

    fill_in 'Username', with: 'username'
    fill_in 'Password', with: 'password'
    click_on 'Login'

    expect(current_path).to eq root_path
  end
end
