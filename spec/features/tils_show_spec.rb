require 'web_spec_helper'

RSpec.feature 'Show page' do
  background do
    Factory[:til, title: 'What I learn form bash', id: 1]
  end

  scenario 'Viewing til' do
    visit '/tils/1'

    expect(page).to have_selector '.article:nth-of-type(1) h1', text: 'What I learn form bash'
  end
end
