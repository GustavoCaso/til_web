require 'db_spec_helper'
require 'til_web/operations/authentication/authenticate'
require 'til_web/authentication/password_digest'

RSpec.describe TilWeb::Operations::Authentication::Authenticate, "#call" do
  subject { described_class.new }
  let(:password) { '8ft83fgibeib' }
  let(:password_digest) { TilWeb::Authentication::PasswordDigest.new.create(password) }
  let(:author) { Factory[:author, password_digest: password_digest] }

  context 'with valid credentials' do
    it 'returns Right' do
      expect(subject.call(author.email, password)).to be_a(Dry::Monads::Either::Right)
    end

    it 'returns the author' do
      expect(subject.call(author.email, password).value.id).to eq(author.id)
    end
  end

  context 'with invalid credentials' do
    it 'returns Left' do
      expect(subject.call(author.email, 'fakepassword')).to be_a(Dry::Monads::Either::Left)
    end

    it 'returns Left when email provided do not exits in db' do
      expect(subject.call('hello@gmail.com', 'fakepassword')).to be_a(Dry::Monads::Either::Left)
    end
  end
end
