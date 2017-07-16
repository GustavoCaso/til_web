Factory.define :author do |f|
  f.name { fake(:name, :first_name) }
  f.text { fake(:internet, :email) }
  f.timestamps
end
