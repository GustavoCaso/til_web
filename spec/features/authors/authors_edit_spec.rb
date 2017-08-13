require 'web_spec_helper'

RSpec.feature 'Edit page' do
  include_context 'create user'
  include_context 'sign in'

  let(:author) { create_user(email: 'john@gmail.com', password: 'test123456') }

  background do
    sign_in(author.email, 'test123456')
  end

  scenario 'Viewing Author edit' do
    visit "/authors/#{author.id}/edit"

    expect(page).to have_selector 'input#name'
    expect(page).to have_selector 'input#email'
    expect(page).to have_selector 'input#avatar'
  end

  scenario 'Fill edit form' do
    visit "/authors/#{author.id}/edit"

    page.fill_in('name', with: 'John')
    page.fill_in('email', with: 'madonna@gmail.com')
    page.click_on 'Update'

    expect(current_path).to eq "/authors/#{author.id}"
  end

  scenario 'Fill edit form invalid values' do
    visit "/authors/#{author.id}/edit"

    page.fill_in('name', with: '')
    page.fill_in('email', with: 'madonna@gmail.com')
    page.click_on 'Update'

    expect(page).to have_selector('.error')
  end
end
