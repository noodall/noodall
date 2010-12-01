Factory.define :home do |home|
  home.title { Faker::Lorem.words(3).join(' ') }
  home.body { Faker::Lorem.paragraphs(6) }
  home.published_at { Time.now }
end
