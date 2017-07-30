require 'db_spec_helper'
require 'til_web/authentication/password_digest'

RSpec.describe TilWeb::Authentication::PasswordDigest do
  subject { described_class.new }
  let(:password) { 'dwiuhdwiuhdi' }
  let(:password_digest) {  subject.create(password) }

  describe '#valid?' do
    it 'returns true if values are correct' do
      expect(subject.valid?(password_digest, password)).to be_truthy
    end

    it 'returns false if values are incorrect' do
      expect(subject.valid?(password_digest, 'e9726e9278y')).to be_falsy
    end
  end
end
