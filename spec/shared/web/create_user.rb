RSpec.shared_context 'create user' do
  def create_user(email:, password:)
    password_digest = TilWeb::Container['authentication.password_digest']
                      .create(password)
    Factory[:author_with_avatar,
            email: email,
            password_digest: password_digest]
  end
end
