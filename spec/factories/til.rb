Factory.define :til do |f|
  f.title { fake(:lorem, :sentence) }
  f.text { fake(:lorem, :sentence, 5) }
  f.association(:author)
  f.timestamps
end
