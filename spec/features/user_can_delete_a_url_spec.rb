require 'rails_helper'

describe 'When a user clicks on delete', type: :feature do
  let!(:user){ create(:user) }
  let!(:url){ create(:url, user: user, title: 'Title') }

  scenario 'the url is removed from the page', :js => true do

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    expect(page).to have_content url.title

    find("#delete").click

    expect(page).not_to have_content url.title
  end
end
