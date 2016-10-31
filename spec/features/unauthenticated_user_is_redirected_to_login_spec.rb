require 'rails_helper'

describe 'When an unauthenticated user visits the root path', type: :feature do
  scenario 'the user is redirected to the login page' do

    visit root_path

    expect(current_path).not_to eq root_path
    expect(current_path).to eq dashboard_path
  end
end
