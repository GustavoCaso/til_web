require 'web_spec_helper'

RSpec.feature 'Home page' do
  scenario 'Viewing tils new' do
    visit '/tils/new'

    expect(page).to have_selector 'form'
    expect(page).to have_selector 'button', text: 'Create Til'
  end
end
