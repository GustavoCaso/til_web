require 'db_spec_helper'
require 'til_web/operations/authentication/logged'

RSpec.describe TilWeb::Operations::Authentication::Logged, "#call" do
  subject { described_class.new }

  context 'with author_id store in session' do
    let(:author) { Factory[:author] }
    it 'returns Right' do
      expect(subject.call({author_id: author.id})).to be_a(Dry::Monads::Either::Right)
    end
  end

  context 'without author_id store in session' do
    it 'returns Left' do
      expect(subject.call({})).to be_a(Dry::Monads::Either::Left)
    end
  end
end
