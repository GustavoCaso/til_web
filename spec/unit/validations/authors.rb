require 'db_spec_helper'
require 'til_web/validations/authors'

RSpec.describe 'TilWeb::Validations::Authors' "#call" do
  subject do
    TilWeb::Validations::Authors.call(attributes)
  end

  context 'valid attributes' do
    let(:attributes) { { 'name' => 'John', 'email' => 'johndoe@gmail.com', 'password' => 'whateverreasontolife' } }
    it '#success' do
      expect(subject).to be_success
    end
  end

  context 'invalid attributes (invalid email)' do
    let(:attributes) { { 'name' => 'John', 'email' => 'f83fguwygd83gd8wdh', 'password' => 'iudwhidhwiudhwiuhd' } }
    it '#success' do
      expect(subject).to_not be_success
    end

    it 'errors' do
      expect(subject.errors.keys).to eq [:email]
    end
  end

  context 'invalid attributes (invalid password)' do
    let(:attributes) { { 'name' => 'John', 'email' => 'john@doe.com', 'password' => 'hello' } }
    it '#success' do
      expect(subject).to_not be_success
    end

    it 'errors' do
      expect(subject.errors.keys).to eq [:password]
    end
  end
end
