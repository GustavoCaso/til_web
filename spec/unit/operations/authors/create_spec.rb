require 'db_spec_helper'
require 'til_web/operations/authors/create'
require 'til_web/repositories/authors'

RSpec.describe TilWeb::Operations::Authors::Create, "#call" do
  subject { described_class.new }
  let(:rom) { TilWeb::Container['persistence.rom'] }
  let(:author_relation) { rom.relations[:authors] }

  context 'valid data provided' do
    let(:attributes) { { 'name' => 'John', 'email' => 'johndoe@gmail.com', 'password' => 'whateverreasontolife' } }
    it 'creates a new author record' do
      expect{
        subject.call(attributes)
      }.to change(author_relation, :count)
    end

    it 'return dry-monads Right' do
      expect(subject.call(attributes)).to be_a Dry::Monads::Either::Right
    end
  end

  context 'invalid data provided' do
    let(:attributes) { { 'name' => 'John', 'email' => 'f83fguwygd83gd8wdh', 'password' => '' } }
    it 'do not creates a new author record' do
      expect{
        subject.call(attributes)
      }.to_not change(author_relation, :count)
    end

    it 'return dry-monads Left' do
      expect(subject.call(attributes)).to be_a Dry::Monads::Either::Left
    end
  end

end
