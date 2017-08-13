require 'db_spec_helper'
require 'til_web/operations/authors/update'
require 'til_web/repositories/authors'
require 'rack/test'

RSpec.describe TilWeb::Operations::Authors::Update, "#call" do
  subject { described_class.new }
  let(:rom) { TilWeb::Container['persistence.rom'] }
  let(:author_relation) { rom.relations[:authors] }
  let(:avatar_path) { fixture_path('avatar.png') }
  let(:avatar_file) { Rack::Test::UploadedFile.new(avatar_path, 'image/png') }
  let(:author) { Factory[:author, name: 'Peter'] }

  context 'valid data provided' do
    let(:attributes_with_image) { { 'name' => 'John', 'email' => 'johndoe@gmail.com', 'avatar' => {tempfile: avatar_file.tempfile} } }
    let(:attributes_without_image) { { 'name' => 'John', 'email' => 'johndoe@gmail.com' } }

    it 'updates authors attributes' do
      author_id = author.id
      expect(author.name).to eq 'Peter'
      result = subject.call(author_id, attributes_with_image).value
      expect(result.id).to eq author_id
      expect(result.name).to eq 'John'
    end

    it 'updates authors avatar_data' do
      result = subject.call(author.id, attributes_with_image).value
      expect(result.avatar_data).to_not be_empty
    end

    it 'do not assign attachemnt if not provided' do
      expect_any_instance_of(ImageUploader::Attacher).to_not receive(:assign)
      subject.call(author.id, attributes_without_image)
    end

    it 'return dry-monads Right' do
      expect(subject.call(author.id, attributes_with_image)).to be_a Dry::Monads::Either::Right
    end
  end

  context 'invalid data provided' do
    let(:attributes) { { 'name' => 2345, 'email' => 'f83fguwygd83gd8wdh', 'password' => '' } }

    it 'return dry-monads Left' do
      expect(subject.call(author.id, attributes)).to be_a Dry::Monads::Either::Left
    end
  end
end
