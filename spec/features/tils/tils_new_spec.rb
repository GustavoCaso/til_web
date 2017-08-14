require 'web_spec_helper'

RSpec.feature 'Home page' do
  include_context 'create user'
  include_context 'sign in'

  scenario 'Viewing tils new without logged in' do
    visit '/tils/new'

    expect(current_path).to eq '/'
  end

  context 'Logged in' do
    let(:author) { create_user(email: 'john@gmail.com', password: 'test123456') }

    background do
      sign_in(author.email, 'test123456')
    end

    scenario 'Viewing tils new without logged in' do
      visit '/tils/new'

      expect(page).to have_selector 'h1', text: 'Create til'
    end
  end
end
