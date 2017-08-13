RSpec.shared_context 'sign in' do
  def sign_in(email, password)
    visit '/login'

    fill_in('email', with: email)
    fill_in('password', with: password)

    click_on 'Login'
  end
end
