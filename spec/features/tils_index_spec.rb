require 'web_spec_helper'

RSpec.feature 'Home page' do
  background do
    Factory[:til, title: 'What I learn form bash']
    Factory[:til, title: 'Multiple query selector']
  end

  scenario 'Viewing tils list' do
    visit '/tils'

    expect(page).to have_selector '.article:nth-of-type(1) h2', text: 'What I learn form bash'
    expect(page).to have_selector '.article:nth-of-type(2) h2', text: 'Multiple query selector'
  end

  scenario 'Viewing tils new' do
    visit '/tils/new'

    expect(page).to have_selector 'form'
    expect(page).to have_selector 'button', text: 'Create Til'
  end
end
