require 'rails_helper'

describe 'When an unauthenticated user is redirected to sign up/log in', type: :feature do
  scenario 'the user can log in' do
    user = User.create(username: 'username',
                       password: 'password',
                       password_confirmation: 'password',
                       email_address: 'username@username.com')

    visit root_path

    expect(current_path).not_to eq root_path
    expect(current_path).to eq dashboard_path

    click_on 'Log In'

    expect(current_path).to eq login_path

    fill_in 'Email address', with: 'username@username.com'
    fill_in 'Password', with: 'password'
    click_on 'Login'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Sign Out'

    click_on 'Sign Out'

    expect(current_path).to eq dashboard_path
    expect(page).to have_content 'Log In'
  end

  scenario 'the user cannot log in with incorrect email address' do
    user = User.create(username: 'username',
                       password: 'password',
                       password_confirmation: 'password',
                       email_address: 'username@username.com')

    visit root_path

    expect(current_path).not_to eq root_path
    expect(current_path).to eq dashboard_path

    click_on 'Log In'

    expect(current_path).to eq login_path

    fill_in 'Email address', with: 'incorrect@username.com'
    fill_in 'Password', with: 'password'
    click_on 'Login'

    expect(current_path).to eq login_path
    expect(page).to have_content 'Login failed. Please, try again.'
  end
end
