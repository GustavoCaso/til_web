require 'db_spec_helper'
require 'til_web/decorators/author'

RSpec.describe TilWeb::Decorators::Author do
  subject { TilWeb::Decorators::Author }
  it 'returns avatar_url if have avatar data' do
    author = Factory[:author_with_avatar]

    author = subject.new(author)
    expect(author.avatar_url).to_not include('default_avatar')
  end

  it 'returns default avatar_url if no avatar data' do
    author = Factory[:author, avatar_data: '']

    author = subject.new(author)
    expect(author.avatar_url).to include('default_avatar')
  end
end
