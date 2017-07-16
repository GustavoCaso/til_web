Factory.define :tils do |f|
  f.title { fake(:lorem, :words, 4) }
  f.text { fake(:lorem, :words, 5) }
  f.association(:author)
  f.timestamps
end
