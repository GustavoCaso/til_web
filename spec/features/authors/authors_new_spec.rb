require 'web_spec_helper'

RSpec.feature 'Create User' do
  scenario 'Viewing authors new' do
    visit '/authors/new'

    expect(page).to have_selector 'form'
    expect(page).to have_selector '#name'
    expect(page).to have_selector '#email'
    expect(page).to have_selector '#password'
    expect(page).to have_selector 'button', text: 'Create Account'
  end

  scenario 'Create new account' do
    visit '/authors/new'

    page.fill_in('name', with: 'John')
    page.fill_in('email', with: 'madonna@gmail.com')
    page.fill_in('password', with: 'test1234')
    page.click_on 'Create Account'

    expect(current_path).to eq '/tils'
  end

  scenario 'Invalid data' do
    visit '/authors/new'

    page.fill_in('name', with: 'John')
    page.fill_in('email', with: 'invalid_email')
    page.fill_in('password', with: 'test1234')
    page.click_on 'Create Account'

    expect(page).to have_selector '.error'
  end
end
