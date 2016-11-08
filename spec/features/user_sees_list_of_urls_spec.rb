require 'rails_helper'

describe 'When a user visits the links index', type: :feature do
  let(:user){ create(:user) }
  let(:url){ create(:url, user: user) }

  scenario 'the user sees URLs', :js => true do

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    expect(page).to have_content 'Enter a URL title'
  end
end
