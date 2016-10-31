require 'rails_helper'

describe 'When an unauthenticated user is redirected to sign up/sign in', type: :feature do
  scenario 'the user can create an account' do

    visit root_path

    expect(current_path).not_to eq root_path
    expect(current_path).to eq dashboard_path

    click_on 'Sign Up'

    expect(current_path).to eq new_user_path

    fill_in 'Username', with: 'username'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    fill_in 'Email address', with: 'username@username.com'
    click_on 'Sign Up'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Welcome to URL Lockbox'
  end
end

# describe 'When an unauthenticated user creates an account', type: :feature do
#   scenario 'the user must use a unique email address' do
#
#     visit dashboard_path
#
#     click_on 'Sign up to create account'
#
#     expect(current_path).to eq new_user_path
#
#     fill_in 'Username', with: 'username'
#     fill_in 'Password', with: 'password'
#     fill_in 'Password confirmation', with: 'password'
#     click_on 'Create new account'
#
#     expect(page).to have_content 'Please provide a username, password and matching confirmation and a valid email address...'
#     expect(current_path).to eq root_path
#   end
# end
