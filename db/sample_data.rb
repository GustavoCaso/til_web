# Build your sample data here
require_relative '../system/boot'
require 'faker'

def create_author(attrs)
  TilWeb::Container['persistence.rom'].commands[:authors][:create].call(attrs)
end

def create_til(attrs)
  TilWeb::Container['persistence.rom'].commands[:tils][:create].call(attrs)
end

author = create_author(
 name: 'Gustavo Caso',
 email: Faker::Internet.email
)

20.times do
  create_til(
    title: Faker::Lorem.sentence(4),
    text: Faker::Lorem.paragraph(5),
    author_id: author[:id]
  )
end
