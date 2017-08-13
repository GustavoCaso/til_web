Factory.define :author do |f|
  f.name { fake(:name, :first_name) }
  f.email { fake(:internet, :email) }
  f.password_digest { fake(:crypto, :sha256) }
  f.timestamps
end

Factory.define(author_with_avatar: :author) do |f|
  f.avatar_data { Test::UploadsHelpers.upload_image('avatar.png') }
end
