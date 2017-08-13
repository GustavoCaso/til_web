require 'db_spec_helper'
require 'til_web/validations/authors/update'

RSpec.describe 'TilWeb::Validations::Authors::Update', "#call" do
  subject do
    TilWeb::Validations::Authors::Update.call(attributes)
  end

  context 'valid attributes' do
    let(:attributes) { { 'name' => 'John', 'email' => 'johndoe@gmail.com' } }
    it '#success' do
      expect(subject).to be_success
    end
  end

  context 'invalid attributes (invalid email)' do
    let(:attributes) { { 'name' => 'John', 'email' => 'f83fguwygd83gd8wdh' } }
    it '#success' do
      expect(subject).to_not be_success
    end

    it 'errors' do
      expect(subject.errors.keys).to eq [:email]
    end
  end

  context 'invalid attributes (invalid name)' do
    let(:attributes) { { 'name' => '', 'email' => 'john@doe.com' } }
    it '#success' do
      expect(subject).to_not be_success
    end

    it 'errors' do
      expect(subject.errors.keys).to eq [:name]
    end
  end
end
