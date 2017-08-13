require 'web_spec_helper'

RSpec.feature 'Show page' do
  include_context 'create user'
  include_context 'sign in'

  let(:author) { create_user(email: 'john@gmail.com', password: 'test123456') }

  background do
    sign_in(author.email, 'test123456')
  end

  scenario 'Viewing Author Edit' do
    visit "/authors/#{author.id}"

    expect(page).to have_selector 'h1', text: 'Profile'
    expect(page).to have_selector 'img.img-circle.profile-picture'
  end
end
